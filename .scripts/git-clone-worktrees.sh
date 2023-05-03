#!/usr/bin/env bash
set -e

url=$1
basename=${url##*/}
name=${2:-${basename%.*}}

mkdir "$name"
cd "$name"

git clone --bare "$url" .bare
echo "gitdir: ./.bare" > .git

# Explicitly sets the remote origin fetch so we can fetch remote branches
git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"

# Gets all branches from origin
git fetch origin
