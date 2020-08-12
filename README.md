
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

Following example triggers when a pull request closed. But if PR is not merged, then `deploy` job won't run. <br>
To avoid `shallow update not allowed` exception use checkout action with fetch-depth 0 parameter.

:bulb: Read more about [Configuring a workflow](https://help.github.com/en/articles/configuring-a-workflow).

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
        with:
        fetch-depth: 0

      - name: "Deploy to dokku"
        uses: fasetto/dokku-deploy@master
        with:
          dokku-deploy-key: ${{ secrets.DOKKU_DEPLOY_KEY }}
          dokku-host: "your-dokku-host.com"
          dokku-app: "your-app"
```
