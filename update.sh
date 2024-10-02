#!/bin/bash

version=$1
mmv=$(echo $version | cut -d . -f -2 -)
echo "Downloading libguestfs-$version"
curl -sL https://download.libguestfs.org/$mmv-stable/libguestfs-$version.tar.gz | tar --wildcards --strip-components=5 -xz libguestfs-$version/golang/src/libguestfs.org/guestfs/*.go

echo "Fixing permissions"
chmod +664 guestfs*.go

echo "Committing changes and tagging"
git add guestfs*.go
git commit -m "feat: Update to libguestfs-$version"
git tag -a "v$version" -m "libguestfs-$version"