#!/bin/bash
# 配合acdcli計算amazon drive上面資料夾和檔案的總共大小
dir_array=($(acd_cli ls /A/梓ユイ | awk '{gsub("[\[\]]","");print $1}'))
file_array=()
total_size=0

while [ ! ${#dir_array[@]} -eq 0 ]
do
        echo "----while start---"${#dir_array[@]}
        tmp_array=()
        for i in "${dir_array[@]}"
        do
                dir_pat="\"kind\": \"([^,]+?)\""
                cmd=`acd_cli metadata $i`
                if [[ $cmd =~ $dir_pat ]]
                then
#                       echo $i' is a '${BASH_REMATCH[1]}
                        if [[ ${BASH_REMATCH[1]} == 'FOLDER' ]]
                        then
                                echo $i' is a '${BASH_REMATCH[1]}
                                dir_in_dir=($(acd_cli ls $i | awk '{gsub("[\[\]]","");print $1}'))
                                for j in "${dir_in_dir[@]}"
                                do
                                        echo "Put "$j" into tmp_array"
                                        tmp_array+=($j)
                                done
                        elif [[ ${BASH_REMATCH[1]} == 'FILE' ]]
                        then
#                               echo $i' is a FILE'
                                file_array+=($i)
                        fi
                else
                        echo $i" is Wrong!"
                        exit
                fi
        done
        dir_array=("${tmp_array[@]}")
        echo "#dir_array: "${#dir_array[@]}
done

for i in "${file_array[@]}"
do
        echo $i" is a file"
        size_pat="\"size\": ([0-9]+?)"
        cmd=`acd_cli metadata $i`
        if [[ $cmd =~ $size_pat ]]
        then
#               echo $i" add to Total_size"
#               echo "size: "${BASH_REMATCH[1]}
                total_size=$(($total_size+${BASH_REMATCH[1]}))
        else
                echo $i" SIZE WRONG"
                exit
        fi
done

echo "Total: "$total_size
