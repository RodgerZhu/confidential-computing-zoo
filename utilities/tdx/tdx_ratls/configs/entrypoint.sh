#
# Copyright (c) 2024 Intel Corporation
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

echo "Try to get TDX measurements ..."

tdx_report_parser || (echo "Not detected TDX TEE.")

cd ${WORK_SPACE_PATH}

if [ "${ROLE}" = "client" ];then
    ./client -host=${ENDPOINT}
else
    ./server -host=${ENDPOINT}
fi