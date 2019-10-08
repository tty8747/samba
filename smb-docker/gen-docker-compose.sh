#!/bin/bash

user=user # user names
dc=docker-compose.yml # output file
count=5 # user quantity
p_len=12 # pass length
smb_root=./raid
public=public

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
echo "      - \"137:137/udp\"" >> ./$dc
echo "      - \"138:138/udp\"" >> ./$dc
echo "      - \"139:139/tcp\"" >> ./$dc
echo "      - \"445:445/tcp\"" >> ./$dc
echo "    read_only: true" >> ./$dc
echo "    tmpfs:" >> ./$dc
echo "      - /tmp" >> ./$dc
echo "    restart: unless-stopped" >> ./$dc
echo "    stdin_open: true" >> ./$dc
echo "    tty: true" >> ./$dc
echo "    volumes:" >> ./$dc
mkdir -p $smb_root/$public
echo "      - $smb_root/$public:/mnt/$public" >> ./$dc

for (( i = 1; i <= $count; i++ ))
  do
    mkdir -p "$smb_root/users/$user$i"
    echo "      - $smb_root/users/$user$i:/mnt/$user$i" >> ./$dc
  done

for (( i = 1; i <= $count; i++ ))
  do
    echo "    command: '-s \"Mount;/mnt\" -s \"$user$i Volume;/mnt/$user$i;no;no;no;;$user$i\" -u \"$user$i;$(pwgen $p_len 1)\"'" >> ./$dc
  done

echo  >> ./$dc
echo "networks:" >> ./$dc
echo "  default:" >> ./$dc
