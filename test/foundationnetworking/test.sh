#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'foundationnetworking' Feature with no options.
#
# For more information, see: https://github.com/devcontainers/cli/blob/main/docs/features/test.md
#
# This test can be run with the following command:
#
#    devcontainer features test \
#                   --features foundationnetworking \
#                   --remote-user root  \
#                   --skip-scenarios    \
#                   --base-image mcr.microsoft.com/devcontainers/base:ubuntu \
#                   /path/to/this/repo

set -e

# Optional: Import test library bundled with the devcontainer CLI
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "execute command" bash -c "dpkg-query --no-pager -l libcurl4-openssl-dev"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
