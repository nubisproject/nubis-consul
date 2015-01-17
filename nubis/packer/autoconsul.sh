#!/bin/sh

# This is an auto-bootstraper for consul

eval `ec2metadata --user-data`

cat <<EOF | tee /etc/consul/zzz-startup.json
{
  "bootstrap_expect": $CONSUL_BOOTSTRAP_EXPECT,
  "token": "$CONSUL_TOKEN",
  "datacenter": "$CONSUL_DC"
}
EOF

#XXX: Wish there was a way to self-discover members of our autoscaling group...
if [ "$CONSUL_JOIN" ]; then
cat <<EOF | tee /etc/consul/zzz-join.json
{
  "start_join": [ "$CONSUL_JOIN" ]
}
EOF
fi

if [ "$CONSUL_PUBLIC" == "1" ]; then
PUBLIC_IP=`ec2metadata --public-ipv4`

cat <<EOF | tee /etc/consul/zzz-public.json
{
  "advertise_addr": "$PUBLIC_IP"
}
fi

service consul restart

exit 0
