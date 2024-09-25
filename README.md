# LAB - Dockerize the Node.js Application and Push it to Docker Hub

In this lab, we will create a simple Node.js project, containerize it using Docker, and push the Docker image to Docker Hub. This step-by-step guide will walk you through the process of building, running, and managing Docker images for a Node.js app.

## Steps

1. **Create a Simple Node.js Project**

    1. Initialize a Node.js project:

        Start by creating a project directory and navigating into it:
        ``` 
        mkdir my-node-app
        cd my-node-app 
        ```

        Initialise a Node.js project using npm
        ```
        npm init -y
        ```

    2. Install dependencies:

        Let's install the express package to create a simple server:
            ```
            npm install express
            ```

    3. Create a simple Express app:

        In the project directory, create an index.js file and add the following code:
        ```
        // index.js
        const express = require('express');
        const app = express();
        const PORT = 3000;

        app.get('/', (req, res) => {
        res.send('Hello, Docker!');
        });

        app.listen(PORT, () => {
        console.log(`Server running on port ${PORT}`);
        });
        ```

    4. Test the Node.js app locally:

        To run the app locally and ensure it works:
            ```
            node index.js
            ```

        Visit http://localhost:3000 in your browser, and you should see "Hello, Docker!" displayed.



2. **Create a Dockerfile**
In the root directory of the project (my-node-app), create a file named Dockerfile with the following content:

        ```
        # Use Node.js official base image
        FROM node:alpine

        # Set working directory
        WORKDIR /app

        # Copy package.json and install dependencies
        COPY package*.json ./
        RUN npm install

        # Copy the rest of the application code
        COPY . .

        # Expose the port that the app runs on
        EXPOSE 3000

        # Command to run the application
        CMD ["node", "index.js"]
        ```

3. **Build the Docker Image**
    1. Build the Docker image:
        From the root of your project, run the following command to build a Docker image:
            ``` docker build -t my-node-app . ```

    2. Verify the image was created:
        You can list your Docker images to verify that the image was successfully built:
            ```
            docker images
            ```

4. **Run the Docker Container**
    1. Run the Docker container:
        Run your newly created Docker image as a container:
            ```
            docker run -p 3000:3000 my-node-app
            ```
        
        The -p 3000:3000 flag maps port 3000 of your host machine to port 3000 in the Docker container.

    2. Test the app in the container:
        
        Open your browser and go to http://localhost:3000, and you should see "Hello, Docker!" again, but now the app is running inside the Docker container.

5. **Push the Docker Image to Docker Hub**
    1. Login to Docker Hub:
            If you're not already logged in to Docker Hub, you need to log in with your credentials:
                ``` docker login ```

    2. Tag the image for Docker Hub:
            You need to tag the Docker image with your Docker Hub username and a version. Replace your-username with your Docker Hub username:
            ```
            docker tag my-node-app your-username/my-node-app:1.0
            ```

    3. Push the image to Docker Hub:
            Push the image to your Docker Hub repository:
            ```
            docker push your-username/my-node-app:1.0
            ```

    4. Verify the push:
            You can go to your Docker Hub account and verify that the image is now listed in your repository.

6. **Run the Image from Docker Hub (Optional)**
    1. Once the image is on Docker Hub, you can pull and run it on any machine with Docker installed:
            Pull the image from Docker Hub:
            ``` docker pull your-username/my-node-app:1.0 ```

    2. Run the container from the pulled image:
            ```docker run -p 3000:3000 your-username/my-node-app:1.0 ```


### That's it! 

You’ve now created a Node.js app, containerized it with Docker, and pushed the image to Docker Hub.
