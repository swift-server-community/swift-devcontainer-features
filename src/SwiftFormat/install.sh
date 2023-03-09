#!/usr/bin/env bash
set -e
set -x

# The 'install.sh' entrypoint script is always executed as the root user.
#
# These following environment variables are passed in by the dev container CLI.
# These may be useful in instances where the context of the final 
# remoteUser or containerUser is useful.
# For more details, see https://containers.dev/implementors/features#user-env-var
# echo "The effective dev container remoteUser is '$_REMOTE_USER'"
# echo "The effective dev container remoteUser's home directory is '$_REMOTE_USER_HOME'"

# echo "The effective dev container containerUser is '$_CONTAINER_USER'"
# echo "The effective dev container containerUser's home directory is '$_CONTAINER_USER_HOME'"

STARTDIR=$(pwd)
TEMPDIR=$(mktemp -d)
VERSION=${VERSION:-"latest"}

cleanup()
{
    cd "$STARTDIR"
    if [ -n "$TEMPDIR" ]; then
        rm -rf "$TEMPDIR"
    fi
}

echo "Downloading nicklockwood/SwiftFormat"

#trap cleanup EXIT $?
git clone https://github.com/nicklockwood/SwiftFormat "$TEMPDIR"

cd "$TEMPDIR"
if [ "$VERSION" == "latest" ]; then
  VERSION=$(git describe --tags)
fi
git checkout "$VERSION"
swift build -c release --product swiftformat

SWIFT_FORMAT=$(swift build -c release --show-bin-path)/swiftformat
cp "$SWIFT_FORMAT" /usr/local/bin
