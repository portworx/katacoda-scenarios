#!/bin/bash -e

ssh root@node01 "sed -i.bkp 's/127.0.0.1 node01/#127.0.0.1 node01/g' /etc/hosts"
ssh root@node02 "sed -i.bkp 's/127.0.0.1 node01/#127.0.0.1 node01/g' /etc/hosts"
ssh root@node03 "sed -i.bkp 's/127.0.0.1 node01/#127.0.0.1 node01/g' /etc/hosts"