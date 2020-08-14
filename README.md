
# dokku-deploy

## What does this action do?

:rocket: Deploys your project to dokku.

## Usage

### Arguments

| Name | Required? | Description | Example |
|:-----| :--------:| :-----------| :-------|
| `dokku-deploy-key` | true | SSH private key to dokku instance. | N/A |
| `dokku-host` | true | Dokku host. | your-dokku-host.com |
| `dokku-app` | true | Application name on dokku. | your-app |
| `dokku-user` | false | Username for dokku host. | default: dokku |
| `force-push` | false | Forces git push command with --force flag. | default: false |

<br>

:bulb: Tip: To avoid `shallow update not allowed` exception use checkout action with fetch-depth 0 parameter.

Read more about [Configuring a workflow](https://help.github.com/en/articles/configuring-a-workflow).

```yaml
name: "Deploy to dokku"

on:
  push:
    branches: [ master ]

jobs:
  deploy:

    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2
        with:
        fetch-depth: 0

      - name: "Deploy to dokku"
        uses: fasetto/dokku-deploy@master
        with:
          dokku-deploy-key: ${{ secrets.DOKKU_DEPLOY_KEY }}
          dokku-host: "your-dokku-host.com"
          dokku-app: "your-app"
```
