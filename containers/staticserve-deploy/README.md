# staticserve deployment image

Example: 

## Gitlab-ci.yml


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
    - echo "pass the validation, staticserve-deploy takes over."
  environment:
    name: example-page-master
    url: https://<hostname>/example

  only:
    - master

```