# Submitting the job inside the master container
docker exec -it spark-master rm -rf /tmp/output_local
docker exec -it spark-worker rm -rf /tmp/output_local

docker exec -it spark-master spark-submit \
    --master spark://spark-master:7077 \
    --conf "spark.jars.ivy=/tmp/.ivy2" \
    /opt/bitnami/spark/data/wordcount.py

# Check results (the 'grep whale' you liked)
# Note: Using 'find' because Spark sometimes keeps files in _temporary folders in container environments
docker exec -it spark-worker find /tmp/output_local -name "part-*" -exec cat {} + | grep whale
