#!/bin/bash

# Clean up previous output if it exists
docker exec namenode hdfs dfs -rm -r -f /user/root/output

# Create input directory
docker exec namenode hdfs dfs -mkdir -p /user/root/input

# Upload data (using the volume path defined in docker-compose)
docker exec namenode hdfs dfs -put -f /input_data/moby-dick.txt /user/root/input/

# Run Hadoop WordCount Example
docker exec namenode hadoop jar \
    /opt/hadoop-3.2.1/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.2.1.jar \
    wordcount /user/root/input /user/root/output

# Show results
echo "--- WordCount Results (whale) ---"
docker exec namenode hdfs dfs -cat /user/root/output/part-r-00000 | grep whale
