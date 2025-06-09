FROM python:3.9-alpine

# Set working directory
WORKDIR /app

# Copy your app into the image
COPY . .

# Install dependencies
RUN pip install flask

# Expose port
EXPOSE 80

# Run the app
CMD ["python", "app.py"]
