#!/bin/bash

test_counts=10
result_path="/tmp/ping_result"

host=$1

ping -c $test_counts $host | grep "bytes from" > "${result_path}_${host}"
wcResult=($(wc "${result_path}_${host}"))
lines=${wcResult[0]}
result=$((200*$lines/$test_counts % 2 + 100*$lines/$test_counts))
echo "${host} 测试结果: ${result}%"
