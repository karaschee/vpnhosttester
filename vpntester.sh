#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

hosts=(j0.0bad.com j1.0bad.com j2.0bad.com j3.0bad.com j4.0bad.com j5.0bad.com hk.0bad.com us0.0bad.com us1.0bad.com us2.0bad.com us2.0bad.com us3.0bad.com us4.0bad.com us5.0bad.com)
pids=()

echo -e "开始 vpnso 相关线路测试..."

for host in ${hosts[*]}
do
  $dir/vpntester_one.sh $host &
  pid=$!
  pids+=($pid)
done

for pid in ${pids[*]}
do
  wait ${pid}
done

exit 0
