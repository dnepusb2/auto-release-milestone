FROM mcr.microsoft.com/dotnet/core/sdk:3.1

LABEL "com.github.actions.name"="Auto Release Milestone"
LABEL "com.github.actions.description"="Drafts a github release based on a Milestone"

LABEL version="0.1.0"
LABEL repository="https://github.com/dnepusb2/auto-release-milestone.git"
LABEL maintainer="Diego Nepomnaschy"

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]

