# Use the official Flutter image
FROM cirrusci/flutter:stable

# Set the working directory
WORKDIR /app

# Copy the project files into the Docker container
COPY . .

# Ensure that Flutter is ready to go
RUN flutter doctor

# Get dependencies
RUN flutter pub get

# Build the Flutter project (adjust as needed, e.g., for web, Android, iOS)
CMD ["flutter", "build", "apk"]
