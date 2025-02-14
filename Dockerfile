# Use an official Python runtime as a base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any dependencies defined in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 80 (since your app is running on port 80)
EXPOSE 80

# Command to run your app
CMD ["python", "counter-service.py"]