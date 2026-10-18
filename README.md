<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/Itz-Agasta/xui.one-installer">
    <img src="./assets//logo.png" alt="Logo" width="250" height="200">
  </a>

  <h3 align="center">XUI.ONE Installer</h3>

  <p align="center">
    A containerized setup for XUI.one using Docker!
    <br />
    <br />
    <a href="https://github.com/Itz-Agasta/xui.one-installer">View Demo</a>
    ·
    <a href="https://github.com/Itz-Agasta/xui.one-installer/issues">Report Bug</a>
    ·
    <a href="https://github.com/Itz-Agasta/xui.one-installer/issues">Request Feature</a>
    ·
    <a href="https://github.com/Itz-Agasta/xui.one-installer/pulls">Send a Pull Request</a>
  </p>
</p>

<!-- Description -->

This repository provides a fully automated and containerized setup for XUI.one, a comprehensive IPTV panel designed for capturing, delivering, and transcoding video content. It supports various applications, including enterprise video delivery, game streaming, and video-on-demand services. The repository includes all necessary scripts, configurations, and Docker files to deploy XUI.one seamlessly.

## Purpose

1. **Automated Setup:** Automatically installs and configures `XUI.one 1.5.12` on an `Ubuntu 24.04` base image.
2. **Dependency Management:** Installs all required dependencies for XUI.one, including MySQL and other necessary packages.
3. **Persistent Storage:** Creates persistent Docker volumes for MySQL and XUI data to ensure data is not lost between container restarts.
4. **Ease of Use:** Simplifies the deployment process, making it easy to set up and manage XUI.one with minimal manual intervention.

<!-- Architecture -->

## Architecture

The XUI.ONE Installer follows a containerized architecture using Docker and Docker Compose to manage the setup and deployment of XUI.ONE. Below is a high-level overview of the architecture:

![arch](assets/arch.png)

## Getting Started

To get started with the XUI.ONE Installer, follow these steps:

### Prerequisites:

Ensure you have the following installed on your system:

- [Docker](https://docs.docker.com/desktop/setup/install/windows-install/)

### Installation:

1. **Clone the Repository**

   ```bash
   git clone https://github.com/Itz-Agasta/xui.one-installer.git
   cd xui.one-installer
   ```

2. **Build and Run the Docker Containers**

   ```bash
   docker-compose up -d
   ```

3. **Access XUI.ONE:** Open the setup URL printed in the logs. With the
   default Compose configuration it is `http://localhost:8080/<setup-code>`.
   Do not use the container's private `172.x.x.x` address.

   ![setup](assets/setup_link.png)

### Ubuntu installation:

If you just want to install XUI.ONE on Your Ubuntu desktop, you can use the following command in your terminal:

```bash
wget https://raw.githubusercontent.com/Itz-Agasta/xui.one-installer/main/install.sh -O install.sh && chmod +x install.sh && ./install.sh
```

> **Supported Ubuntu versions:**
>
> ✅ Ubuntu 18</br>
> ✅ Ubuntu 20</br>
> ✅ Ubuntu 22</br>
> ✅ Ubuntu 24</br>

## Configuration

Data is persisted in two Docker volumes:

- **xui_mysql:** MySQL database files
- **xui_home:** XUI installation files

## Troubleshooting

If you encounter any issues, refer to the logs:

```bash
docker-compose logs
```

For further assistance, you can [Report Bug](https://github.com/Itz-Agasta/xui.one-installer/issues) or [Request Feature](https://github.com/Itz-Agasta/xui.one-installer/issues).

## License

This project is licensed under the [MIT License](https://github.com/Itz-Agasta/xui.one-installer/blob/main/License). See the LICENSE file for more details.

Feel free to Send a [Pull Request](https://github.com/Itz-Agasta/xui.one-installer/pulls) if you have improvements or fixes.
