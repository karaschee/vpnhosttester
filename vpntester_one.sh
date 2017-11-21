#!/bin/bash

host=$1
test_counts=10
result_path="/tmp/ping_result_${host}"
result_sorted_path="${result_path}_sorted"

ping -c $test_counts $host | grep "bytes from" > $result_path
wc_result=($(wc $result_path))
lines=${wc_result[0]}
sort -t " " -k 7 $result_path > $result_sorted_path
first_line=$(head -n 1 $result_sorted_path)
result=$((200*$lines/$test_counts % 2 + 100*$lines/$test_counts))
echo "${result}% ${host} - ${first_line}"
