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
VERSION=${VERSION:-"default"}

cleanup()
{
    cd "$STARTDIR"
    if [ -n "$TEMPDIR" ]; then
        rm -rf "$TEMPDIR"
    fi
}

# Work out swift-format version tag from swift version
getSwiftFormatVersion()
{
    VERSION_FILTER="main"
    # get swift version
    SWIFT_VERSION=$(swift --version | egrep -o 'Swift version [0-9]+.[0-9]+' | tail -c +15)
    # convert to swift-format version filter
    case $SWIFT_VERSION in
        "5.2") VERSION_FILTER="0.50200.*";;
        "5.3") VERSION_FILTER="0.50300.*";;
        "5.4") VERSION_FILTER="0.50400.*";;
        "5.5") VERSION_FILTER="0.50500.*";;
        "5.6") VERSION_FILTER="0.50600.*";;
        "5.7") VERSION_FILTER="0.50700.*";;
        *) VERSION_FILTER="main";;
    esac
    # get version from git tags
    VERSION=$(git tag -l "$VERSION_FILTER" | tail -n 1)
    echo $VERSION
}

trap cleanup EXIT $?

echo "Downloading apple/swift-format"
git clone https://github.com/apple/swift-format "$TEMPDIR"
cd "$TEMPDIR"

if [ "$VERSION" == "default" ]; then
  VERSION=$(getSwiftFormatVersion)
fi

git checkout "$VERSION"
swift build -c release --product swift-format
SWIFT_FORMAT=$(swift build -c release --show-bin-path)/swift-format
cp "$SWIFT_FORMAT" /usr/local/bin
