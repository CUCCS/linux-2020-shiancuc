#!/usr/bin/env bash

function help	#帮助文档
{
	echo "NAME"
	echo "	task1.sh - batch processing on images"
	echo "SYNOPSIS"
	echo '	bash task1.sh [-d directory] [-j|-c num] [-e|-p|-s "text"] [-v] [--help]'
	echo "DESCRIPTION"
	echo "	-d directory	Type in the directory of pictures that you want to operate"
	echo "	-j		Type in to specify a compression level for JPEG images"
	echo "	-c		Type in a width to resize the image while preserving the aspect ratio"
	echo "	-e		Type in the watermark that you want to embed in the pictures"
	echo "	-p		Type in the prefix that you want to add to the names of the pictures"
	echo "	-s		Type in the suffix that you want to add to the names of the pictures"
	echo "	-v		To convert png/svg to jpeg files"
	echo "	--help		To get the help manual"
}


# 对jpeg格式图片进行图片质量压缩
function JPEGCompress
{
	[ -d "./Pic/j-output" ] || mkdir ./Pic/j-output	#建立文件夹
	for p in "$1"*.jpg; do
		fullname="$(basename "$p")"	#去掉路径
		filename="${fullname%.*}"	#删除.后面字符串
		convert "$p" -quality "$2"% ./Pic/j-output/"$filename".'jpg'
	done
}



#对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率
function CompressResolution
{
	[ -d "./Pic/c-output" ] || mkdir ./Pic/c-output	#建立文件夹
	for p in $(find "$1" -regex  '.*\.jpg\|.*\.svg\|.*\.png'); do	#正则表达式匹配图片
		fullname="$(basename "$p")"
		filename="${fullname%.*}"
		extension="${fullname##*.}"	#删除.前面字符串
		convert "$p" -resize "$2" ./Pic/c-output/"$filename"."$extension"
	done
}


#对图片批量添加自定义文本水印
function Embed
{
	[ -d "./Pic/e-output" ] || mkdir ./Pic/e-output	#建立文件夹
	for p in $(find "$1" -regex  '.*\.jpg\|.*\.svg\|.*\.png'); do
		fullname="$(basename "$p")"
		filename="${fullname%.*}"
		extension="${fullname##*.}"

		width=$(identify -format %w "$p")	#图像宽度
		#使用composite指令添加水印
		convert -background '#0008' -fill white -gravity center \
		-size "${width}"x30 caption:"$2" "$p" +swap -gravity south \
		-composite ./Pic/e-output/"$filename"."$extension"
	done
}


#批量重命名(统一添加文件名前缀或后缀，不影响原始文件扩展名)
function addPrefix		#添加前缀
{
	[ -d "./Pic/p-output" ] || mkdir ./Pic/p-output	#建立文件夹
	for p in "$1"*.*; do
		fullname=$(basename "$p")
		filename="${fullname%.*}"
		extension="${fullname##*.}"
		cp "$p" ./Pic/p-output/"$2""$filename"."$extension"
	done
}
function addSuffix		#添加后缀
{
	[ -d "./Pic/s-output" ] || mkdir ./Pic/s-output	#建立文件夹
	for p in "$1"*.*; do
		fullname=$(basename "$p")
		filename="${fullname%.*}"
		extension="${fullname##*.}"
		cp "$p" ./Pic/s-output/"$filename""$2"."$extension"
	done
}



#将png/svg图片统一转换为jpg格式图片
function Cvt2JPG
{
	[ -d "./Pic/v-output" ] || mkdir ./Pic/v-output	#建立文件夹
	for p in $(find "$1" -regex '.*\.svg\|.*\.png');do	
		fullname=$(basename "$p")
		filename="${fullname%.*}"
		extension="${fullname##*.}"
		convert "$p" ./Pic/v-output/"$filename"".jpg"
	done
}


##### Main #####
dir=""

if [[ "$#" -lt 1 ]]; then
	echo "What operations do you want? Type in please."
else 
	while [[ "$#" -ne 0 ]]; do
		case "$1" in
			"-d")
				dir="$2"
				shift 2
				;;
			"-j")
				if [[ "$2" != '' ]]; then 
					JPEGCompress "$dir" "$2"
					shift 2
				else 
					echo "You need to put in a quality parameter."
				fi
				;;
				
			"-c")
				if [[ "$2" != '' ]]; then 
					CompressResolution "$dir" "$2"
					shift 2
				else 
					echo "You need to put in a resize rate."
				fi
				;;
				
			"-e")
				if [[ "$2" != '' ]]; then 
					Embed "$dir" "$2"
					shift 2
				else 
					echo "You need to input a string to be embeded into pictures."
				fi
				;;
				
			"-p")
				if [[ "$2" != '' ]]; then 
					addPrefix "$dir" "$2"
					shift 2
				else 
					echo "You need to input a prefix."
				fi
				;;
				
			"-s")
				if [[ "$2" != '' ]]; then 
					addSuffix "$dir" "$2"
					shift 2
				else 
					echo "You need to input a suffix."
				fi
				;;
			
			"-v")
				Cvt2JPG "$dir"
				shift
				;;
				
			"--help")
				help
				shift
				;;
		esac
	done
fi
