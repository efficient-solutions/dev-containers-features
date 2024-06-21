#!/usr/bin/env bash

set -e
set -o pipefail

install(){
    architecture=$(dpkg --print-architecture)
    case "${architecture}" in
        amd64) architectureStr=x86_64 ;;
        arm64) architectureStr=aarch64 ;;
        *)
            echo "AWS CLI does not support machine architecture '$architecture'. Please use an x86-64 or ARM64 machine."
            exit 1
    esac

    local artifact="aws-sam-cli-linux-${architectureStr}.zip"
    local directory="aws-sam-cli"

    # Check if curl is installed
    if ! command -v curl &> /dev/null; then
        echo "curl could not be found, please install it first."
        exit 1
    fi

    # Check if unzip is installed
    if ! command -v unzip &> /dev/null; then
        echo "unzip could not be found, please install it first."
        exit 1
    fi

    # Download the artifact
    if ! curl -sLO "https://github.com/aws/aws-sam-cli/releases/latest/download/$artifact"; then
        echo "Failed to download $artifact"
        exit 1
    fi

    # Unzip the artifact
    if ! unzip $artifact -d $directory; then
        echo "Failed to unzip $artifact"
        exit 1
    fi

    # Run the installer
    if ! $directory/install; then
        echo "Installation failed"
        exit 1
    fi

    # Cleanup
    rm -f $artifact
    rm -rf $directory
}

echo "Installing AWS SAM CLI..."

install

echo "Done!"