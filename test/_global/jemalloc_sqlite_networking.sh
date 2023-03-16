#!/bin/bash

# The 'test/_global' folder is a special test folder that is not tied to a single feature.
#
# This test file is executed against a running container constructed
# from the value of 'jemalloc_sqlite_networking' in the tests/_global/scenarios.json file.
#
# The value of a scenarios element is any properties available in the 'devcontainer.json'.
# Scenarios are useful for testing specific options in a feature, or to test a combination of features.
#
# This test can be run with the following command (from the root of this repo)
#    devcontainer features test --global-scenarios-only .

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

check "execute command" bash -c "dpkg-query --no-pager -l libjemalloc-dev"
check "execute command" bash -c "dpkg-query --no-pager -l libcurl4-openssl-dev"
check "execute command" bash -c "dpkg-query --no-pager -l sqlite3"
check "execute command" bash -c "dpkg-query --no-pager -l libsqlite3-dev"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
