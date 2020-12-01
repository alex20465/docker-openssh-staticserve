#!/bin/bash

eval $(ssh-agent -s)
echo -n $SSH_PRIVATE_KEY | base64 --decode > ~/.ssh/id_rsa

chmod 600 ~/.ssh/id_rsa
ls -l ~/.ssh
ssh-add ~/.ssh/id_rsa


# create remote dir

ssh -p $SSH_PORT \
    -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    $SSH_USERNAME@$SSH_HOSTNAME \
    "mkdir -p $REMOTE_DIR"

# upload source dir

scp -P $SSH_PORT \
    -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    -r $SOURCE_DIR/** \
    $SSH_USERNAME@$SSH_HOSTNAME:$REMOTE_DIR