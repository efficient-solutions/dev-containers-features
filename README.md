# Dev Containers Features

[Development Containers](https://containers.dev/) [Features](https://containers.dev/implementors/features/) are self-contained, shareable units of installation code and development container configuration. These features allow you to quickly and easily add additional tooling, runtimes, or libraries to your development container, facilitating a streamlined development experience for you and your collaborators.

## Features

### [aws-sam-cli](src/aws-sam-cli)

This feature installs the latest version of the [AWS SAM CLI](https://github.com/aws/aws-sam-cli), a command-line interface for building, testing, and deploying serverless applications defined by AWS Serverless Application Model (AWS SAM).

To use the `aws-sam-cli` feature in your development container, reference it in your `devcontainer.json` configuration file:

```json
"features": {
    "ghcr.io/efficient-solutions/dev-containers-features/aws-sam-cli:1": {}
}
```