# Use the official Jupyter base image
FROM jupyter/base-notebook:latest

# Set the working directory inside the Docker container
WORKDIR /Airflow

# Copy your notebook files to the container's working directory
COPY . /Airflow

# Install Apache Airflow
RUN pip install apache-airflow==2.1.4

# Initialize the Airflow database
RUN airflow db init

# Create an Airflow user
RUN airflow users create \
    --username admin \
    --firstname John \
    --lastname Doe \
    --role Admin \
    --email admin@example.com \
    --password admin
# Expose the Jupyter Notebook port
EXPOSE 8888

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]


