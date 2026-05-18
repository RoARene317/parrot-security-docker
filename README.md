# Parrot Security Desktop on the Browser

This repository contains a Docker Compose application that runs a Kali Linux desktop accessible through your web browser via NoVNC.

<img width="1920" height="1034" alt="{6E33702A-1078-454D-A07C-3DC80D1CB2A4}" src="https://github.com/user-attachments/assets/dce58ee6-6217-49e6-8bb8-4d0509edabc6" />


## Description

This Docker Compose application provides:

- **Parrot Security**: A web server running NoVNC with Kali Linux Desktop environment.
  - Default password: `parrot`
  - Default exposed port: `8080`

## Requirements

To run this application, you need:

- Docker Engine
- Docker Compose

## Usage

### Quick Start

1. Clone the repository:
   ```bash
   git clone https://github.com/RoARene317/parrot-security-docker.git
   ```

2. Navigate to the repository directory:
   ```bash
   cd parrot-security-docker
   ```

3. Pull the required Docker images:
   ```bash
   docker compose pull
   ```

4. Set a custom password for the environment (optional):
   ```bash
   export PASSWORD="YourVNCPassword"
   ```

5. Start the containers in detached mode:
   ```bash
   docker compose up -d
   ```

6. Access the web application at: http://localhost:8080/vnc.html

## Environment Variables

You can customize the application using these environment variables:

| Variable | Description | Default |
|----------|-------------|---------|
| `PASSWORD` | VNC password | `parrot` |
| `BIND` | Address and port to bind the server (format: IP:PORT) | `0.0.0.0:8080` |

Example usage:
```bash
export PASSWORD="mysecretpassword"
export BIND="0.0.0.0:9090"
docker compose up -d
```

## License

This Docker Compose application is released under the MIT License. See the [LICENSE](https://www.mit.edu/~amini/LICENSE.md) file for details.

## Disclaimer

The software developed and distributed for hacking purposes is intended for **educational and testing purposes only**. The use of this software for any illegal activity is strictly prohibited. The developers and distributors of the software are not liable for any damages or legal consequences resulting from the misuse of the software.
