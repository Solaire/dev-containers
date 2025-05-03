# Use an official Node.js image as the base
FROM node:22

# Set the working directory inside the container
WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    bash \
    && apt-get clean

# Expose port 3000 for Astro's development server
EXPOSE 3000

# Default command to keep the container running
CMD ["bash"]