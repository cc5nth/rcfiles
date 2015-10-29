#############################
account default
host smtp.gmail.com
port 587
from kkk.cccc@gmail.com
tls on
tls_starttls on
#tls_certcheck off
tls_trust_file /home/kkkk/Mail/certs/Equifax_Secure_CA.pem
auth on
user kkk.cccc
password gxxxxxxxx
logfile ~/.msmtp.log

#############################
account eeeeee
host smtp.gmail.com
port 587
from cc.xxxx@gmail.com
tls on
tls_starttls on
#tls_certcheck off
tls_trust_file /home/kkkk/Mail/certs/Equifax_Secure_CA.pem
auth on
user cc.xxxx
password gxxxxxxxx
logfile ~/.msmtp.log

#############################
account cxzdes
host smtp.gmail.com
port 587
from cxxxxx@gmail.com
tls on
tls_starttls on
#tls_certcheck off
tls_trust_file /home/kkkk/Mail/certs/Equifax_Secure_CA.pem
auth on
user cxxxxx
password xxxxxxxx
logfile ~/.msmtp.log

