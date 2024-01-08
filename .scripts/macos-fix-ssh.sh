#!/usr/bin/env bash

echo "AuthorizedKeysFile %h/.ssh/authorized_keys /etc/ssh/authorized_keys.d/%u" > /etc/ssh/sshd_config.d/101-authorized-keys.conf

launchctl stop com.openssh.sshd
