# voters-speak
voters speak site

## Deployment

This repository includes GitHub deployment automation. See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed deployment instructions.

### Quick Start

To create a deployment package locally:
```bash
./create-deployment-package.sh
```

This will create a `voters-speak-github-deployment.zip` file containing all deployment files.

### GitHub Actions

The repository includes automated deployment via GitHub Actions:
- Workflow file: `.github/workflows/deploy.yml`
- Deployment artifacts are available in the Actions tab after each run
- Package name: `voters-speak-github-deployment.zip`

For more information, see [DEPLOYMENT.md](DEPLOYMENT.md).
