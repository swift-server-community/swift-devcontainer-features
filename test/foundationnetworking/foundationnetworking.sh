#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'foundationnetworking' feature.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "execute command" bash -c "dpkg-query --no-pager -l libcurl4-openssl-dev"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
