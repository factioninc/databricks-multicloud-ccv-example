#!/bin/bash
# 
# MIT License
# 
# Copyright (c) 2022 Faction Group, LLC
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# This init script is used to add a hostfile entry if one is missing
#
# Not recommended for production usage, where DNS should be utilized,
# but useful for a simple POC

set -x

### CHANGE IP and Faction Regional hostname to suit your Object endpoint and hostname
IP="172.30.0.1"
HOSTNAME="us-west-1.s3.faction.cloud"

# Test for existing host entry
MATCH="$(grep -n $HOSTNAME /etc/hosts)"
if [ ! -z "$MATCH" ] ;
then
	echo "Host File entry exists and WILL NOT be updated. Entry with line number: "
	echo "$MATCH"
else
	echo "Adding host entry."
	echo "$IP $HOSTNAME" | sudo tee -a /etc/hosts > /dev/null
fi

