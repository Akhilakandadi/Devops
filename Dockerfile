# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file from the restaurent folder into the container
COPY restaurent/requirements.txt /app/

# Install the dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the entire content of the 'restaurent' directory into the container
COPY restaurent /app/

# Expose port 8000 for the Django application
EXPOSE 8000

# Run Django server (for production, you can change this to use Gunicorn or another server)
CMD ["python", "/app/manage.py", "runserver", "0.0.0.0:8000"]
