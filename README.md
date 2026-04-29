# Big Data Exercise: Hadoop and Spark Cluster

This project provides a containerized environment to run Big Data processing exercises using Apache Hadoop and Apache Spark. It sets up a localized cluster to demonstrate WordCount operations using both MapReduce (Hadoop) and PySpark.

## Project Structure

- `docker-compose.yaml`: Orchestrates the Hadoop (Namenode, Datanode, ResourceManager, NodeManager) and Spark (Master, Worker) containers.
- `hadoop.sh`: Shell script to automate the execution of a Hadoop MapReduce job.
- `spark.sh`: Shell script to automate the execution of a PySpark job.
- `data/`: Directory containing the input dataset (`moby-dick.txt`) and the Spark script (`wordcount.py`).

---

## Prerequisites: Installing Docker

Before running the exercises, you must have Docker and Docker Compose installed on your machine.

### Windows

1. **Install WSL 2**: Open PowerShell as Administrator and run:

    ```powershell
    wsl --install
    ```

2. **Download Docker Desktop**: Download the installer from the [Docker Official Website](https://www.docker.com/products/docker-desktop).
3. **Installation**: Run the installer and ensure the "Use the WSL 2 based engine" option is selected.
4. **Verification**: Open a terminal and run `docker --version`.

### Linux (Agnostic)

1. **Install using the convenience script**:

    ```bash
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    ```

2. **Manage Docker as a non-root user**:

    ```bash
    sudo usermod -aG docker $USER
    ```

    *Note: Log out and log back in for this to take effect.*

3. **Verification**: Run `docker --version`.

### macOS

1. **Download Docker Desktop**: Download the installer (Intel or Apple Chip version) from the [Docker Official Website](https://www.docker.com/products/docker-desktop).
2. **Installation**: Drag and drop Docker into the Applications folder and follow the setup instructions.
3. **Verification**: Open a terminal and run `docker --version`.

---

## Getting Started

### 1. Spin up the Cluster

Navigate to the project root and run:

```bash
docker compose up -d
```

This will start all necessary services in the background.

### 2. Verify Services

Check if the containers are running:

```bash
docker compose ps
```

You can also access the Web UIs:

- **Hadoop Namenode**: [http://localhost:9870](http://localhost:9870)
- **Spark Master**: [http://localhost:8080](http://localhost:8080)

---

## Running the Exercises

### Hadoop MapReduce

The script uploads the text file to HDFS, runs the built-in WordCount example, and filters the result for the word "whale".

**Linux/macOS**:

```bash
chmod +x hadoop.sh
./hadoop.sh
```

**Windows (PowerShell)**:

```powershell
./hadoop.ps1
```

### Apache Spark (PySpark)

The script submits the `wordcount.py` job to the Spark cluster. It processes the data and saves the output to a temporary directory inside the container.

**Linux/macOS**:

```bash
chmod +x spark.sh
./spark.sh
```

**Windows (PowerShell)**:

```powershell
./spark.ps1
```

---

## Cleaning Up

To stop and remove the containers and volumes:

```bash
docker compose down -v
```
