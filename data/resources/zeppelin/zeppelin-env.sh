#!/bin/bash
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# IMPORTANT: Before you make any changes to this file, ensure that you 
#            stop Zeppelin with `./gradlew stop`
#
#            After making the change run `./gradlew UpdateEnv`, followed
#            by `./gradlew start` or `./gradlew restart`

export ZEPPELIN_PORT=8081
export SPARK_HOME=/usr/iop/current/spark-client
export HADOOP_CONF_DIR=/usr/iop/current/hadoop-client/conf
export JAVA_HOME=/opt/ibm/jdk


export ZEPPELIN_NOTEBOOK_S3_BUCKET=rawkintrevos-notebooks
export ZEPPELIN_NOTEBOOK_S3_USER=rawkintrevo
export AWS_ACCESS_KEY_ID=AKIAJXZR777E7S74T5MQ
export AWS_SECRET_ACCESS_KEY=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
        