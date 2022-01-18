re        #!/bin/sh
 
 TS=`date "+%Y-%m-%d_%H:%M:%S"`
 NG_START="systemctl start nginx"
 NGINX_HOME="/etc/nginx/"
 NGINX_BAK_DIR="/home/dmytro.tiurikov/nginx_bak"
  

 
  backup(){ cp -r $NGINX_HOME ${NGINX_BAK_DIR}_${TS}
        }

  check(){     
        ps auxw | grep nginx | grep -v grep > /dev/null
        if [ $? != 0 ]
        then
        echo "$TS NGINX is not running!!! Trying to start...." 
        ${NG_START}
        
        else
        echo "$TS NGINX is running fine! Stay come and don't be a paranoid - go meditate or somthing "
        
        fi }


 retry(){ for i in 1 2 3; do check && break || sleep 3; done }
 
 cron(){ crontab -l > mycron
  echo "5 0 * * * $(whoami) $(pwd)/ng_check.sh" >> mycron
  crontab mycron
  rm mycron 
  }

cron
backup
retry
