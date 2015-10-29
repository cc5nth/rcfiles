poll pop.gmail.com with proto POP3
user 'xx.xxxx@gmail.com' there with password 'gggggxxxx' is 'xxxx' here

mda "/usr/bin/procmail -d %T"

options
keep
ssl
sslcertck
sslcertpath /home/xxxx/Mail/certs/
no fetchall

set daemon 600

