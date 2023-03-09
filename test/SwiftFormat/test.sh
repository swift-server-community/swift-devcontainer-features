#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'jemalloc' Feature with no options.
#
# For more information, see: https://github.com/devcontainers/cli/blob/main/docs/features/test.md
#
# Eg:
# {
#    "image": "<..some-base-image...>",
#    "features": {
#      "jemalloc": {}
#    },
#    "remoteUser": "root"
# }
#
# Thus, the value of all options will fall back to the default value in
# the Feature's 'devcontainer-feature.json'.
#
# These scripts are run as 'root' by default. Although that can be changed
# with the '--remote-user' flag.
#
# This test can be run with the following command:
#
#    devcontainer features test \
#                   --features SwiftFormat \
#                   --remote-user root  \
#                   --skip-scenarios    \
#                   --base-image swift:5.7 \
#                   /path/to/this/repo

set -e

# Optional: Import test library bundled with the devcontainer CLI
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "Check Installed" bash -c "swiftformat --version"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
