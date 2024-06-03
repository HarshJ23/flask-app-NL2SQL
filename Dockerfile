# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set environment variables to avoid some issues with Python output buffering
ENV PYTHONUNBUFFERED=1

# Install necessary system packages and ODBC drivers
RUN apt-get update && \
    apt-get install -y curl apt-transport-https gnupg2 unixodbc-dev && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/debian/10/prod.list | tee /etc/apt/sources.list.d/msprod.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql18

# Create a directory for the app
RUN mkdir /app
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Expose the port the app runs on
EXPOSE 5000

# Run the Flask app
CMD ["python", "main.py"]
