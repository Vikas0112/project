# Use a base image (e.g., Alpine Linux)
FROM alpine:latest

# Set working directory
WORKDIR /app

# Copy local files into the container
COPY . .

# Install any necessary tools (if needed)
# RUN apk add --no-cache bash curl

# Default command
CMD ["echo", "Running SBI service test container"]
