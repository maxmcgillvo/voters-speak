# Deployment Guide for voters-speak

## Overview
This document describes the deployment process for the voters-speak site.

## GitHub Actions Deployment

The repository includes automated deployment via GitHub Actions. The workflow is configured in `.github/workflows/deploy.yml`.

### Automated Deployment

The deployment workflow triggers on:
- Push to `main` branch
- Pull requests to `main` branch
- Manual workflow dispatch

### Deployment Package

The workflow creates a deployment package named `voters-speak-github-deployment.zip` which includes:
- All repository files
- Necessary configuration
- Documentation

### Accessing Deployment Artifacts

After a successful workflow run:
1. Go to the Actions tab in the GitHub repository
2. Select the latest workflow run
3. Download the `voters-speak-github-deployment` artifact
4. Extract the zip file to access deployment files

## Manual Deployment

To manually create a deployment package:

```bash
# Create deployment directory
mkdir -p deployment-package

# Copy repository files
cp -r ./* deployment-package/

# Create zip package
cd deployment-package
zip -r ../voters-speak-github-deployment.zip . -x "*.git*"
```

## Deployment Process

1. Ensure all changes are committed and pushed
2. Trigger deployment via:
   - Push to main branch, or
   - Manual workflow dispatch from Actions tab
3. Wait for workflow to complete
4. Download deployment artifact
5. Deploy to target environment

## Configuration

### Environment Variables

Configure the following environment variables for deployment:
- `GITHUB_TOKEN`: Automatically provided by GitHub Actions
- Custom variables can be added as needed

### Secrets

Add deployment secrets in repository Settings > Secrets:
- Add any API keys or credentials needed for deployment

## Support

For deployment issues, check:
- GitHub Actions logs
- This documentation
- Repository README.md
