# Use an official Node.js image as a parent image
FROM node:14

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json
COPY src/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY src/ .

# Expose the application on port 3000
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
