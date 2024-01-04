#
# Copyright (c) 2022 Intel Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/bin/bash
set -e

if  [ -n "$1" ] ; then
    ip_addr=$1
else
    ip_addr=127.0.0.1
fi

if  [ -n "$2" ] ; then
    image_tag=$2
else
    image_tag=grpc-ratls-secretmanger-dev:tdx-dcap1.15-centos8-latest
fi

# Use the host proxy as the default configuration, or specify a proxy_server
# no_proxy="localhost,127.0.0.1"
# proxy_server="" # your http proxy server

if [ "$proxy_server" != "" ]; then
    http_proxy=${proxy_server}
    https_proxy=${proxy_server}
fi

docker run -d \
    --name=secretmanger \
    --privileged=true \
    --add-host=pccs.service.com:${ip_addr} \
    --net=host \
    -v /dev:/dev \
    -v /home:/home/host-home \
    -v /var/run/aesmd/aesm.socket:/var/run/aesmd/aesm.socket \
    -e no_proxy=${no_proxy} \
    -e http_proxy=${http_proxy} \
    -e https_proxy=${https_proxy} \
    ${image_tag}
