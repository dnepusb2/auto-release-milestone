#!/bin/bash
set -u # undeclared variables 

if [ "$GITHUB_EVENT_NAME" != "milestone" ]; then
    echo "::debug::The event name was '$GITHUB_EVENT_NAME'"
    exit 0
fi

event_type=$(jq --raw-output .action $GITHUB_EVENT_NAME)

if [ $event_type != "closed" ]; then 
    echo "::debug::The event type was '$GITHUB_EVENT_PATH'"
    exit 0
fi 

milestone_name=$(jq --raw-output .milestone.title $GITHUB_EVENT_PATH)

IFS= '/' read onwer repository <<< "$GITHUB_REPOSITORY"
release_url=$(dotnet gitreleasemanager create \
--milestone $milestone_name \
--targetcommitish $GITHUB_SHA \
--token $repo_token \
--owner $owner
--repository $repository)

if [ $? -ne 0 ]; then 
    echo "::error::Failed to create the release draft"
    exit 1
fi 

echo "::set-output name=release-url::$release_url" # each logging command needs a new-line character, echo does it for us

exit 0