#!/usr/bin/env bash

if [[ ! -f "worldcupplayerinfo.tsv" ]];then
        wget https://c4pr1c3.github.io/LinuxSysAdmin/exp/chap0x04/worldcupplayerinfo.tsv
fi

function Info
{
	Num_20_younger=0 	# 计数年龄小于20岁的人数
	Num_between_20_30=0	# 计数年龄为[20,30]岁的人数
	Num_30_older=0		# 计数年龄大于30岁的人数

	shortest=80		#记录名字最短长度
	shortestname=()		#记录名字长度最短的人的名字
	longest=0		#记录名字最长长度
	longestname=()		#记录名字长度最长的人的名字

	MinAge=80		# 记录最小年龄
	youngestname=()		# 记录年龄最小的人的名字（不止一个）
	MaxAge=0		# 记录最大年龄
	oldestname=()		# 记录年龄最大的人的名字（不止一个）
	
	#确定Age、Player、Position列的列号
	line=$(head -1 "$1")
	IFS="	" read -r -a arr <<< "$line"
	i=0
	for w in "${arr[@]}"; do
		if [[ "$w" == "Age" ]]; then 
			index_age="$i" 
		fi
		if [[ "$w" == 'Player' ]]; then
			index_name="$i"
		fi
		if [[ "$w" == "Position" ]]; then 
			index_position="$i"
		fi
		i=$((i+1))
	done

	declare -A dic		#定义字典，<球场位置，数量>
	
	#从第二行开始往下读取数据
	sum=0
	ln=2
	line="$(sed -n "$ln"p "$1")"
	while [[ "$line" != "" ]]; do
		sum=$((sum+1))
		IFS="	" read -r -a arr <<< "$line"
		age=${arr["$index_age"]}
		name=${arr["$index_name"]}
		position=${arr["$index_position"]}
		

		#统计不同年龄区间人数和百分比
		if [[ "$age" -lt 20 ]]; then
			Num_20_younger=$((Num_20_younger+1))
		elif [[ "$age" -gt 30 ]]; then
			Num_30_older=$((Num_30_older+1))
		else
			Num_between_20_30=$((Num_between_20_30+1))
		fi





		#统计不同场上位置的球员数量、百分比
		mark=0
		for key in "${!dic[@]}"; do			#判断字典中是否有键与$position相同
			if [[ "$position" == "$key" ]]; then 
				dic[$key]=$(( ${dic[$key]}+1 ))
				mark=1
				break
			fi
		done
		if [[ "$mark" -ne 1 ]]; then
			value=1 
			dic[$position]=$value
		fi






		#统计名字最长和最短的球员
		length=0
		IFS=' ' read -r -a namarr <<< "$name"
		for w in "${namarr[@]}"; do
			length=$((length+${#w}))
		done

		# 出现更小长度
		if [[ $length -lt $shortest ]]; then 
			shortest=$length 
			shortestname=("$name")
		# 名字长度相等
		elif [[ $length -eq $shortest ]];then
			flag=0
			for n in "${shortestname[@]}";do 	# 去重
				if [[ $n == "$name" ]]; then
					flag=1
					break
				fi
			done
			if [[ $flag -eq 0 ]]; then
				shortestname=(${shortestname[@]} "$name")
			fi
		fi

		# 出现更长长度
		if [[ $length -gt $longest ]]; then 
			longest=$length 
			longestname=("$name");
		# 名字长度相等
		elif [[ $length -eq $longest ]]; then
			flag=0
			for n in "${longestname[@]}"; do
				if [[ $n == "$name" ]]; then
					flag=1
					break
				fi
			done
			if [[ $flag -eq 0 ]]; then
				longestname[${#longestname[@]}+1]="$name"
			fi
		fi



		
		#统计最大年龄和最小年龄
		if [[ $age -lt $MinAge ]]; then
			MinAge="$age" 
			youngestname=("$name") 			#若小于，则更新最小年龄，重构数组
		elif [[ $age -eq $MinAge ]]; then
			youngestname=("${youngestname[@]}" "$name")	#若等于，则直接添加进数组
		fi

		if [[ $age -gt $MaxAge ]]; then 
			MaxAge="$age" 
			oldestname=("$name")		#若大于，则更新最大年龄，重构数组
		elif [[ $age -eq $MaxAge ]]; then 
			oldestname=("${oldestname[@]}" "$name")	#若等于，则直接添加进数组
		fi	



		ln=$((ln+1))
		line="$(sed -n "$ln"p "$1")"
	done
		

	#问题1
	echo "年龄小于20的球员人数为$Num_20_younger，占全部球员人数的$(printf "%.4f" "$(echo "$Num_20_younger/$sum*100" | bc -l)")%。"
	echo "年龄在20到30之间的球员人数为$Num_between_20_30，占全部球员人数的$(printf "%.4f" "$(echo "$Num_between_20_30/$sum*100" | bc -l)")%。"
	echo "年龄大于30的球员人数为$Num_30_older，占全部球员人数的$(printf "%.4f" "$(echo "$Num_30_older/$sum*100" | bc -l)")%。"
	printf "\n"

	#问题2
	printf "+--------------------------------+\n"
	printf "| Position |  Amount  |  Rate(%%) |\n"
	printf "+--------------------------------+\n"
	for position in "${!dic[@]}"; do
		printf "|%-10s|%-10s|" "$position" "${dic[$position]}"
		printf "%-10.2f|\n" "$(echo "${dic[$position]}/$sum*100" | bc -l)"
		printf "+--------------------------------+\n" 
	done
	printf "\n"

	#问题3
	for p in "${longestname[@]}"; do
		echo "$p"
	done
	printf "有最长的名字，长度为%s\n" "$longest"
	for p in "${shortestname[@]}"; do
		echo "$p"
	done
	printf "有最短的名字，长度为%s\n" "$shortest" 

	printf "\n"

	#问题4
	echo "年龄最大的球员是: "
	for p in "${oldestname[@]}"; do echo "$p"; done
	echo "有$MaxAge岁。"

	echo "年龄最小的球员是: "
	for p in "${youngestname[@]}"; do echo "$p"; done
	echo "有$MinAge岁。" 
	echo -e "\n"
}

Info "worldcupplayerinfo.tsv"
