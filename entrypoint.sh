#!/bin/bash
set -u # undeclared variables 

echo "::set-output name=release-url::http://example.com" # each logging command needs a new-line character, echo does it for us

exit 0