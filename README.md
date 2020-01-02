# Obsolete
Nice example from 2019 shared here :
https://about.gitlab.com/blog/2019/01/28/android-publishing-with-gitlab-and-fastlane/

https://gitlab.com/gitlab-org/project-templates/android

### Note :
02/01/2020: Latest fastlane version not compatible with ruby<2.4, either use higher version of ruby or don't commit Gemfile.lock.



[![Codefresh build status]( https://g.codefresh.io/api/badges/build?repoOwner=ClemMahe&repoName=DockerfileAndroidFastlane&branch=master&pipelineName=DockerfileAndroidFastlane&accountName=clemmahe&type=cf-1)]( https://g.codefresh.io/repositories/ClemMahe/DockerfileAndroidFastlane/builds?filter=trigger:build;branch:master;service:59371c999d2f2000010a45aa~DockerfileAndroidFastlane)

# Dockerfile for Android with Fastlane

Based on openjdk:8 with Android SDK 25,26, Buildtools 25.0.3,26.0.0 and last version of fastlane (with dependencies such as ruby-dev & gem installed). If asked, i could set a static version of fastlane.

# Pull from Docker Cloud

docker pull clemmahe/dockerfileandroidfastlane

# Run

docker run -i -t clemmahe/dockerfileandroidfastlane /bin/bash

# Use as base image

FROM clemmahe/dockerfileandroidfastlane

# Emulator

When using this image, an emulator has been created with the following name : emulatorN5XAPI25, based on API25 & on N5X.
