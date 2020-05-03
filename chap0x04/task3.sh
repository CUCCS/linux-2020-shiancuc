#!/usr/bin/env bash

if [[ ! -f "web_log.tsv.7z" ]];then
        wget https://c4pr1c3.github.io/LinuxSysAdmin/exp/chap0x04/web_log.tsv.7z
fi

if [[ ! -f "web_log.tsv" ]];then
        7z x web_log.tsv.7z
fi

function help	#帮助文档
{
	echo "NAME"
	echo "	task3.sh - batch processing on web server access log"
	echo "SYNOPSIS"
	echo "	bash task3.sh [-d directory] [-h|-i|-u|-r|-x num] [-l url] [--help]"
	echo "DESCRIPTION"
	echo "	-d directory	the dir of the file that you want to operate"
	echo "	-h		show the top num source hosts visited"
	echo "	-i		show the top num source IP addresses visited"
	echo "	-u		show the top num most frequently visited url"
	echo "	-r		show the percentages of different response status codes"
	echo "	-x		show the top num url and the times of occurance related to 4xx response"
	echo "	num		100 in default"
	echo "	-l url		show the top num source hosts related to the url input"
	echo "	--help		to get the help manual"
}



function host	#统计访问来源主机TOP 100和分别对应出现的总次数
{
	#sed -n '2,$p' "$1"	显示第二行到最后一行
	#awk -F '\t'		行内分隔符为\t
	#sort -r (降序排列) -n(按数值排序) -k 2(按输出的第2列排序)
	#sed -n 1,"$2"p		显示第一行到第一百行

	sed -n '2,$p' "$1" \
	| awk -F '\t' ' {host[$1]++} END {for(h in host) printf("%-50s %-10d\n",h,host[h])}' \
	| sort -r -n -k 2| sed -n 1,"$2"p
}


function Ip	#统计访问来源主机TOP 100 IP和分别对应出现的总次数
{
	#ip由数字组成
	#| awk -F '\t' '$1 ~ /[0-9]+\.[0-9]+\.[0-9]+\.[0-9]/{ip[$1]++} END {for(i in ip) printf("%-15s%-10d\n",i,ip[i])}' \

	sed -n '2,$p' "$1" \
	| awk -F '\t' '$1 ~ /[0-9]+\.[0-9]+\.[0-9]+\.[0-9]/{ip[$1]++} END {for(i in ip) printf("%-15s%-10d\n",i,ip[i])}' \
	| sort -r -n -k 2 | sed -n 1,"$2"p
}


function url	#统计最频繁被访问的URL TOP 100
{
	sed -n '2,$p' "$1" \
	| awk -F '\t' '{url[$5]++} END {for(u in url) printf("%-50s%-10d\n",u,url[u])}' \
	| sort -r -n -k 2 | sed -n 1,"$2"p
}


function response	#统计不同响应状态码的出现次数和对应百分比
{
	#所有行读完后，NR即为总数
	sed -n '2,$p' "$1" \
	| awk -F '\t' '{rsp[$6]++} END {for(r in rsp) printf("%-4s%-10d%-4.4f%%\n",r,rsp[r],rsp[r]/NR*100)}' \
	| sort -r -n -k 2 | sed -n '1,$p'
}


function Resp4xx	#分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数
{
	#先找出所有以4开头的响应码，暂存在code中
	code=$(sed -n '2,$p' "$1" | awk -F '\t' '{if($6~/^4/) {print $6} }' | sort -u)	#sort -u  结果去重

	#对每一个状态码，都重新遍历整个文件
	for c in $code; do
		echo "$c"
		sed -n '2,$p' "$1" | awk -F '\t' '{if("$6"=="$c") {cnt[$5]++}} END {for(t in cnt)printf("%-50s%-10d\n",t,cnt[t])}' | sort  -r -n -k 2 | sed -n 1,"$2"p
		echo " "
	done
}



function urlHost	#给定URL输出TOP 100访问来源主机
{
         sed -n '2,$p' "$1"| \
         awk -F '\t' '{if("$5"=="$2") a[$1]++} END {for(h in a) printf("%-30s%-10d\n",h,a[h])}' \
         | sort -r -n -k 2 | sed -n '1,100p'
}




##### Main #####

dir=""
num=100

if [[ $# -eq 0 ]]; then		#输入参数为0则提示
	echo "What operations do you want? Type in please."
else
	while [[ $# -ne 0 ]]; do
		if [[ "$1" == "-d" ]];then		#输入文件路径
			dir="$2"
			shift 2				#shift去掉两个参数

		elif [[ "$1" == "--help" ]]; then	#查看帮助文档
			help				#执行help函数
			shift				#shift去掉一个参数

		elif [[ "$1" == "-l" ]]; then 		#输入URL
			shift				#shift去掉一个参数
			if [[ "$1" == "" ]]; then	#没有给定URL则提示
				echo "You need to input an URL."
			else
				if [[ $dir != "" ]]; then	#文件路径不为空
					urlHost "$dir" "$1"	#执行urlHost函数
				else
					echo "You need to input a file."
				fi
				shift
			fi

		else						#[-h|-i|-u|-r|-x num]
			if [[ "$2" != "" ]]; then
				num=$2				#默认num为100
			fi
			if [[ $dir != '' ]]; then
				case "$1" in
					'-h') host "$dir" "$num"	#执行host函数
						shift 2
						;;
					'-i') Ip "$dir" "$num"		#执行Ip函数
						shift 2
						;;
					'-u') url "$dir" "$num"		#执行url函数
						shift 2
						;;
					'-r') response "$dir"		#执行response函数
						shift
						;;
					'-x') Resp4xx "$dir" "$num"	#执行Resp4xx函数
						shift 2
						;;
				esac
			else
				echo "You need to input a file."
				shift 2
			fi
		fi
	done
fi
