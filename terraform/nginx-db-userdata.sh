
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
echo BEGIN
date '+%Y-%m-%d %H:%M:%S'
echo END


sudo su ec2-user
sudo yum update -y && 
sudo amazon-linux-extras install -y nginx1 php7.2 
sudo yum install -y mariadb-server php-mbstring php-xml
sudo sudo usermod -aG nginx ec2-user && sudo chown -R ec2-user:nginx /usr/share/nginx && 
sudo chmod 2775 /usr/share/nginx && find /usr/share/nginx -type d -exec sudo chmod 2775 {} \;
find /usr/share/nginx -type f -exec sudo chmod 0664 {} \;
cd /usr/share/nginx/html && wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz && 
mkdir phpMyAdmin && tar -xvzf phpMyAdmin-latest-all-languages.tar.gz -C phpMyAdmin --strip-components 1 && 
rm phpMyAdmin-latest-all-languages.tar.gz
mysql -u root -e "SET PASSWORD FOR root@localhost = PASSWORD('mypassword')";
sleep 3
sudo systemctl restart mariadb nginx php-fpm && sudo systemctl enable mariadb nginx
