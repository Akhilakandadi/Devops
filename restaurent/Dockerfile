# Use a slim base image with Python 3.11
FROM python:3.11-slim AS builder

# Set working directory
WORKDIR /app

# Update system packages to patch vulnerabilities
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Final stage for runtime
FROM python:3.11-slim

WORKDIR /app

# Update system packages in final image
RUN apt-get update && apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*
RUN python manage.py collectstatic
# Copy Python packages and binaries from builder
COPY --from=builder /usr/local/lib/python3.11/site-packages/ /usr/local/lib/python3.11/site-packages/
COPY --from=builder /usr/local/bin/ /usr/local/bin/

# Copy project files
COPY . .

# Expose port for Gunicorn
EXPOSE 8000

# Run Gunicorn with the correct WSGI application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "restaurent.wsgi:application"]
