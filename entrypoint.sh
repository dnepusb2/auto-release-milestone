#!/bin/bash
set -u # undeclared variables 

if [ "$GITHUB_EVENT_NAME" != "push" ]; then
    echo "::debug::The event name was '$GITHUB_EVENT_NAME'"
    exit 0
fi

event_type=$(jq --raw-output .action $GITHUB_EVENT_NAME)

if [ $event_type != "closed" ]; then 
    echo "::debug::The event type was '$GITHUB_EVENT_PATH'"
    exit 0
fi 

milestone_name=$(jq --raw-output .milestone.title $GITHUB_EVENT_PATH)

echo "::set-output name=release-url::http://example.com" # each logging command needs a new-line character, echo does it for us

exit 0