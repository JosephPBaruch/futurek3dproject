
# josephbaruch.com

Welcome to **josephbaruch.com**, a containerized frontend web application built with **Vite** and **TypeScript**. The project runs inside a devcontainer, with Kubernetes (`k3d`) managing the local cluster for easy deployment and development.

## Table of Contents

- [Technologies](#technologies)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Running the Application](#running-the-application)
- [Development](#development)
- [Containerization](#containerization)
- [Deployment in k3d](#deployment-in-k3d)
- [Contributing](#contributing)
- [License](#license)

## Technologies

This project uses the following technologies:

- **Frontend Framework**: [Vite](https://vitejs.dev/) + [TypeScript](https://www.typescriptlang.org/)
- **Containerization**: [Docker](https://www.docker.com/)
- **Development Environment**: [DevContainer](https://code.visualstudio.com/docs/remote/containers)
- **Kubernetes Cluster**: [k3d](https://k3d.io/)

## Getting Started

### Prerequisites

Before running the application, ensure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/)
- [VSCode](https://code.visualstudio.com/) with the DevContainers extension
- [k3d](https://k3d.io/#installation)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)

### Setup

1. **Clone the repository**:

   ```bash
   git clone https://github.com/JosephPBaruch/josephbaruch.com
   ```

2. **Open the project in VSCode**:

   If you have the DevContainer extension installed, VSCode should prompt you to open the project inside the devcontainer.

   If it doesn’t, press `F1` and select **Remote-Containers: Reopen in Container**.

3. **Build the Docker image** (if not already built):

   ```bash
   docker build -t josephbaruch.com .
   ```

### Running the Application

To run the application inside the devcontainer:

1. Open the terminal inside VSCode.

2. Install dependencies:

   ```bash
   npm install
   ```

3. Run the development server:

   ```bash
   npm run dev
   ```

   Your Vite + TypeScript app should now be running at [http://localhost:3000](http://localhost:3000).

## Development

The project is structured using **Vite** as the build tool and **TypeScript** as the development language. Here are some important commands for development:

- **Start development server**: 
  ```bash
  npm run dev
  ```
  
- **Build for production**:
  ```bash
  npm run build
  ```

- **Lint the code**:
  ```bash
  npm run lint
  ```

## Containerization

This project is fully containerized using Docker. It runs inside a **DevContainer** to provide a consistent development environment. The `Dockerfile` contains the necessary steps to build the image and run the app.

To rebuild the image manually:

```bash
docker build -t josephbaruch.com .
```

### DevContainer Setup

The project comes with a pre-configured `.devcontainer` folder. This allows you to use the **Visual Studio Code Remote - Containers** extension to open the project inside a containerized development environment.

## Deployment in k3d

To run the application in a local Kubernetes cluster using **k3d**, follow these steps:

1. **Create a k3d cluster**:

   ```bash
   k3d cluster create mycluster
   ```

2. **Load your Docker image into k3d**:

   ```bash
   k3d image import josephbaruch.com:latest -c mycluster
   ```

3. **Apply Kubernetes manifest** to deploy the app:

   ```bash
   kubectl apply -f deployment.yaml
   ```

4. **Check the status of the application**:

   ```bash
   kubectl get pods
   kubectl get svc
   ```

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch for your feature (`git checkout -b feature/my-feature`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/my-feature`).
5. Open a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
