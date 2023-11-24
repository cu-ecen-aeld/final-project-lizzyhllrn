# !/bin/bash
# Tester script for sockets using Netcat

target="192.168.0.23"
port=9000
string="hello"

echo ${string} | nc ${target} ${port}