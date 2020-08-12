
# dokku-deploy

## What does this action do?

:bulb: Deploys your project to dokku.

## Usage

:bulb: Read more about [Configuring a workflow](https://help.github.com/en/articles/configuring-a-workflow).

### Arguments

| Name | Required? | Description | Example |
|:-----| :--------:| :-----------| :-------|
| `dokku-deploy-key` | true | SSH private key to dokku instance. | N/A |
| `dokku-host` | true | Dokku host. | your-dokku-host.com |
| `dokku-app` | true | Application name on dokku. | your-app |
| `dokku-user` | false | Username for dokku host. | default: dokku |
| `force-push` | false | Forces git push command with --force flag. | default: false |

<br>

```yaml
name: "Deploy to dokku"

on:
  pull_request:
    types: [ closed ]
    branches: [ master ]

jobs:
  deploy:

    runs-on: ubuntu-latest
    if: github.event.pull_request.merged

    steps:
      - uses: actions/checkout@v2

      - name: "Deploy to dokku"
        uses: fasetto/dokku-deploy@v1
        with:
          dokku-deploy-key: ${{ secrets.DOKKU_DEPLOY_KEY }}
          dokku-host: "your-dokku-host.com"
          dokku-app: "your-app"
```
