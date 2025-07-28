# Hackathon-compliant Dockerfile (amd64, <200MB)
FROM --platform=linux/amd64 python:3.9-slim

# Set working directory inside the container
WORKDIR /app

# Copy all files (code, requirements, etc.) into container
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Ensure input & output folders exist inside container
RUN mkdir -p /app/input /app/output

# Run the extractor automatically when container starts
ENTRYPOINT ["python", "extractor.py"]
