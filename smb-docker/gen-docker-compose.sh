#!/bin/bash

user = user
dc = docker-compose.yml
count = 10

touch ./$dc

echo "version: '3.4'" > ./$dc

echo "services:" >> ./$dc
echo "  samba:" >> ./$dc
echo "    image: dperson/samba" >> ./$dc
echo "    environment:" >> ./$dc
echo "      TZ: 'EST5EDT'" >> ./$dc
echo "    networks:" >> ./$dc
echo "      - default" >> ./$dc
echo "    ports:" >> ./$dc
echo "      - "137:137/udp"" >> ./$dc
echo "      - "138:138/udp"" >> ./$dc
echo "      - "139:139/tcp"" >> ./$dc
echo "      - "445:445/tcp"" >> ./$dc
echo "    read_only: true" >> ./$dc
echo "    tmpfs:" >> ./$dc
echo "      - /tmp" >> ./$dc
echo "    restart: unless-stopped" >> ./$dc
echo "    stdin_open: true" >> ./$dc
echo "    tty: true" >> ./$dc
echo "    volumes:" >> ./$dc
echo "      - /mnt:/mnt:z" >> ./$dc
echo "      - /mnt2:/mnt2:z" >> ./$dc
for (( i = 1; i <= 10; i++ ))
  do
#    echo -n "command: -s \"Mount;/mnt\" -s "$user$i Volume;/mnt2;" >> ./$dc
#    echo -n 'y es;' >> ./$dc
#    echo "no;no;bob -u "$user;$(pwgen 12 1)"" >> ./$dc
  done
echo  >> ./$dc
echo "networks:" >> ./$dc
echo "  default:" >> ./$dc

# user=user; for i in {1..5}; do echo command: -s "Mount;/mnt" -s "$user$i Volume;/mnt2;yes;no;no;bob" -u "$user;$(pwgen 12 1)"  ; done
