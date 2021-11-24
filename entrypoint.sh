#!/bin/bash
#If user not exists, create new user with UID from env (to match volume permissions)
getent passwd "$USER" >/dev/null || useradd "$USER" --uid ${UID:-1000} -s /bin/bash
#Copy skeleton files and set proper permissions
/sbin/mkhomedir_helper "${USER}" 027
chown "$USER" -R /home/"${USER}"
#Run browser under created user
su - "$USER" -c "DISPLAY=$DISPLAY avidemux" 
