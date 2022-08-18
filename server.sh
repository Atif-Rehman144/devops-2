 sudo apt install apache2

#ENBALING REQUIRED MODULES IF DISABLED
# sudo a2enmod proxy
# sudo a2enmod proxy_http
# sudo a2enmod proxy_balancer
# sudo a2enmod lbmethod_byrequests

#concating lines to load balacner confg files

cat "<proxy balancer://euniversity.edu>" >> /etc/apache2/conf-enabled/loadbalancer.conf
cat "        BalancerMember http://127.0.0.1:8080/loadfactor=40" >> /etc/apache2/conf-enabled/loadbalancer.conf
cat "        BalancerMember http://127.0.0.1:8081/loadfactor=35" >> /etc/apache2/conf-enabled/loadbalancer.conf
cat "        BalancerMember http://127.0.0.1:8082/loadfactor=25" >> /etc/apache2/conf-enabled/loadbalancer.conf
cat "        ProxySet lbmethod=bytraffic" >> /etc/apache2/conf-enabled/loadbalancer.conf
cat "</proxy>" >> /etc/apache2/conf-enabled/loadbalancer.conf
cat "ProxyPass "/site" "balancer://euniversity.edu/"" >> /etc/apache2/conf-enabled/loadbalancer.conf
cat "ProxyPassReverse "/site" "balancer://euniversity.edu/"" >> /etc/apache2/conf-enabled/loadbalancer.conf

sudo systemctl restart apache2

env -i "$BASH" -c 'python3 server_1.py'
env -i "$BASH" -c 'python3 server_2.py'
env -i "$BASH" -c 'python3 server_3.py'