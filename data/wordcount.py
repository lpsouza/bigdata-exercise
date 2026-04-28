from pyspark.sql import SparkSession
import sys

# English comments as requested ;)
# Initialize Spark Session
spark = SparkSession.builder.appName("WordCountLocal").getOrCreate()

# In Docker, we use the shared volume path
input_path = "/opt/bitnami/spark/data/moby-dick.txt"
output_path = "/tmp/output_local"

# Read text file
text_file = spark.read.text(input_path)

# MapReduce logic (the same from your cloud exercises)
word_counts = (
    text_file.rdd
    .flatMap(lambda line: line.value.split())
    .map(lambda word: (word, 1))
    .reduceByKey(lambda a, b: a + b)
)

# Save result
word_counts.saveAsTextFile(output_path)
spark.stop()