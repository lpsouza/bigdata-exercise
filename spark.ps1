# Submitting the job inside the master container
docker exec spark-master rm -rf /tmp/output_local
docker exec spark-worker rm -rf /tmp/output_local

docker exec spark-master spark-submit `
    --master spark://spark-master:7077 `
    --conf "spark.jars.ivy=/tmp/.ivy2" `
    /opt/bitnami/spark/data/wordcount.py

# Check results
# Note: Using Select-String as the PowerShell equivalent to grep
docker exec spark-worker find /tmp/output_local -name "part-*" -exec cat {} + | Select-String "whale"
