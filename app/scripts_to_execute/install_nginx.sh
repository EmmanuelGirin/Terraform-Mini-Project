#! /bin/bash
#update and install dependencies
yum update -y
amazon-linux-extras install nginx1 -y
systemctl enable --now nginx
echo "<h1>Did we do it ??</h1> <p>I think so</p>" > /usr/share/nginx/html/index.html
chmod 755 /usr/share/nginx/html/index.html
systemctl restart nginx