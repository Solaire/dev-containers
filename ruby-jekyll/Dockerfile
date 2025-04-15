# Use an official Ruby image as the base
FROM ruby:3.2

# Set the working directory inside the container
WORKDIR /workspace

# Install Jekyll and Bundler
RUN gem install jekyll bundler

# Expose port 4000 for Jekyll's development server
EXPOSE 4000

# Default command to keep the container running
CMD ["bash"]