# ddev-vnc

[![tests](https://github.com/thursdaybw/ddev-vnc/actions/workflows/tests.yml/badge.svg)](https://github.com/thursdaybw/ddev-vnc/actions/workflows/tests.yml) ![project is maintained](https://img.shields.io/maintenance/yes/2024.svg)

## Table of Contents
- [What is ddev-vnc?](#what-is-ddev-vnc)
- [Installation](#installation)
- [Usage](#usage)
- [Testing](#testing)
- [Debugging](#debugging)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## What is ddev-vnc?
`ddev-vnc` is a DDEV add-on that provides VNC (Virtual Network Computing) capabilities for DDEV projects. This allows developers to access a graphical desktop environment within their DDEV containers.

## Installation
### Using `ddev get`
```bash
ddev get thursdaybw/ddev-vnc
```

## Usage
### Starting the VNC Server
```bash
ddev start
```
### Accessing the VNC Server
- Use a VNC client to connect to `localhost:5901`
- Enter the password set in the configuration

## Testing
### Running Tests Locally
```bash
bats ./tests/test.bats
```
### Running Tests in GitHub Actions
- Tests are automatically run on push and pull request events.

## Debugging
### Using Logs
- Check the VNC server logs for issues
```bash
ddev logs vnc
```
### Common Issues and Solutions
- Issue: Unable to connect to VNC server
  - Solution: Ensure the VNC server is running and the ports are correctly configured.

## Contributing
We welcome contributions! Please see our [contributing guidelines](CONTRIBUTING.md) for more details.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements
- Thanks to the DDEV team for their support and contributions.
