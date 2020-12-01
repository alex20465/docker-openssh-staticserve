# Staticserve deploy

Responsible to deploy / upload the static assets (`public/` .. `SOURCE_DIR`) to an SSH remote server.

> Warning: The process ignores the .known-hosts fingerprints, don't use it for extreme sensitive data.



## gitlab-ci.yml example


```yml
deploy:
  stage: deploy
  image: alex20465/staticserve-deploy:1.0
  variables:

    # EXPECTED BY CI PREDEFINED VARIABLES:

    # SSH_HOSTNAME: <host pointed to staticserve-openssh-server>
    # SSH_PRIVATE_KEY: !!PRIVATE KEY SHOULD BY BASE64 ENCODED
    # SSH_USERNAME: <default staticserve>
    # SSH_PORT: <default 2222>

    REMOTE_DIR: /pages/example
    SOURCE_DIR: <!ABSOLUTE PATH TO PUBLIC-DIR>
  script:
    - echo "no scripts required..."
  environment:
    name: example-page-master
    url: https://<hostname>/example

  only:
    - master

```

> Encode private-key `cat ~/.ssh/id_rsa | base64 --wrap 0`