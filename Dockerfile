# Use an official Python runtime as the base image
FROM python:3.10.6-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the project dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Django project code into the container
COPY . .

# Set environment variables
# ENV DJANGO_SETTINGS_MODULE=myproject.settings
ENV PYTHONUNBUFFERED=1

# Expose the default Django development server port
EXPOSE 8000

# Start Redis server
CMD redis-server --daemonize yes

# Run Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]