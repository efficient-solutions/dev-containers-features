# AWS SAM CLI

This feature installs the latest version of the [AWS SAM CLI](https://github.com/aws/aws-sam-cli), a command-line interface for building, testing, and deploying serverless applications defined by AWS Serverless Application Model (AWS SAM).

To use the `aws-sam-cli` feature in your development container, reference it in your `devcontainer.json` configuration file:

```json
"features": {
    "ghcr.io/efficient-solutions/dev-containers-features/aws-sam-cli:1": {}
}
```