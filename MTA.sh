#!/bin/bash
# $1 sender_email_address
# $2 rect_email_address
# $3 mail content

email_pattern="\w.*@\w.*"
if [[ $1 =~ $email_pattern ]] && [[ $2 =~ $email_pattern ]]
then
    domain=$(echo $2 | sed -n 's/.*@//p')
#    echo "domain : "$domain
    mx=$(/usr/bin/dig "$domain" mx | awk "/^$domain"'/{print $NF}')
#    echo $mx

#    body=$(cat $3)

    for i in $mx
    do
        retry=1
        while [ $retry -lt  4 ]
        do
          ( echo open $i 25
            sleep 5
            echo HELO pro.mailcloud.com.tw
            sleep 2
            echo mail from:"<${1}>"
            sleep 1
            echo rcpt to:"<${2}>"
            sleep 1
            echo data
            sleep 1
            echo from:"${1}"
            echo to:"${2}"
            echo "$body"
            echo
            echo .
            sleep 1
            echo quit ) | telnet > /tmp/mta.log
            status_code =$(tail -c 1 /tmp/mta.log)
            if [ $status_code == "2" ]
            then
                echo "OK"
                break
            elif [ $status_code == "4" ]
            then
                echo "Retry"
                retry=$((retry+1))
            elif [ $status_code == "5" ]
            then
                echo "EXIT"
                break
            fi

        done  # end of  while

        break
    done      # end of for
    rm /tmp/mta.log > /dev/null 2>&1

else
    echo "Usage: ./mta.sh send_mail rect_mail content"
    echo "ex: ./mta.sh xx@gmail.com xx@hinet.net HELLO"

fi


