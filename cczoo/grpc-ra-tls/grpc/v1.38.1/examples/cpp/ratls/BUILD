# Copyright 2020 the gRPC authors.
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

licenses(["notice"])  # 3-clause BSD

cc_binary(
    name = "server",
    srcs = [
        "server.cc",
        "getopt.hpp",
    ],
    defines = ["BAZEL_BUILD"],
    deps = [
        "//:grpc++",
        "//:grpc++_reflection",
        "//examples/protos:ratls_proto",
    ],
)

cc_binary(
    name = "client",
    srcs = [
        "client.cc",
        "getopt.hpp",
    ],
    defines = ["BAZEL_BUILD"],
    deps = [
        "//:grpc++",
        "//examples/protos:ratls_proto",
    ],
)
