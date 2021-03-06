# Docker Staticserve

Minimalistic static serve docker compose file with the goal to deploy through CI.

> Warning: The CI staticserve-deploy process ignores the .known-hosts fingerprints, don't use it for extreme sensitive data.

## Setup

```
$ docker-compose up -d
```

## Configuration

Under `config/openssh` the openssh-server has generated the ssh-server configurations, to access to the openssh server add your public-key under `config/openssh/.ssh/authorized_keys`.

NGINX serves all the `pages/`.

## Deployment


Use the IMAGE `staticserve-deploy` image (`alex20465/staticserve-deploy`) which provides preconfigured SCP and private-key setup via Environment Variables.

Define the following environment variables on your CI:

```
SSH_PRIVATE_KEY=<base64 encoded>
SSH_USERNAME=staticserve
SSH_HOSTNAME=<staticserve-openssh-server-hostname>
SSH_PORT=2222
SOURCE_DIR=/public
REMOTE_DIR=/pages/<example-page>
```

> Encode private-key `cat ~/.ssh/id_rsa | base64 --wrap 0`