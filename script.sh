#!/usr/bin/bash
sudo apt update -y
sudo apt install -y apache2
sudo mv /var/www/html/index.html /home/ubuntu/
echo "<h1>Studying cloud engineering at Altschool Africal </h1>" >> /var/www/html/index.html
sudo systemctl restart apache2