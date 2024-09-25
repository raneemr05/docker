# Step 1: Use the Node.js official image
FROM node:14

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Step 4: Copy the rest of the application
COPY . .

# Step 5: Expose the port your app runs on
EXPOSE 3000

# Step 6: Define the command to run the application
CMD ["node", "index.js"]
