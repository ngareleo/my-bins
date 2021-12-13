#!/bin/bash
#we want to check all JPEG files and group the music files, the pictures etc
cd /home/leo/Downloads
path="$HOME/Downloads/"
unsplashSearch="unsplash"
pexelsSearch="pexels"
num=( *  )
fileCount=0


for file in "${num[@]}"
do
	if ! [ -d "$path$file" ];
	then
		#check if they are img files
		echo "$path$file"
		if [[ -e "$path$file" ]]; then
			case ${file:((len - 3)):3} in
				jpg)
					sub=${file:((len - 12)):8}
					pex=${file:0:6}
					if [ "${sub[0]}" == $unsplashSearch ];
					then
						#move the files
						mv "$path$file" "$HOME/Pictures/Unsplash"

					elif [ "$pex" == $pexelsSearch ];
					then
						mv "$path$file" "$HOME/Pexels"

					else
						mv "$path$file" "$HOME/Pictures/Others"

					fi	
					let "fileCount += 1"	
					;;
				png)
					mv "$path$file" "$HOME/Pictures/Png"
					let "fileCount += 1"
					;;
				svg)
					mv "$path$file" "$HOME/Pictures/icons"
					let "fileCount += 1"
					;;
				mp4)
					mv "$path$file" "$HOME/Videos"
					let "fileCount += 1"
					;;
					
				pdf)
					mv "$path$file" "$HOME/Documents"
					let "fileCount += 1"
					;;
					
				zip|deb)
					mv "$path$file" "$path/Compressed"
					let "fileCount += 1"
					;;
				*)
					if [[ ${file:((len - 2)):2} == "gz"  ]]; then
						mv "$path$file" "$path/Compressed"
						let "fileCount += 1"
					elif [ ${file:((len - 4)):4} == "jpeg" ];then
						mv "$path$file" "$HOME/Pictures/Others"
						let "fileCount += 1"
					elif [ ${file:((len - 4)):4} == "docx" ];then
						mv "$path$file" "$HOME/Documents/"
						let "fileCount += 1"
					fi
					;;
			esac 
		fi
	fi
			
done

echo "Moved $fileCount files"
