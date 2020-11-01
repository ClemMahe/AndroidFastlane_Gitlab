# Introduction
What I wanted here is for my personal project to be deployed on Alpha channel at every push.
When developing I use an Emulator but I like to be able to get the application on my phone later one.

This project is just an example of the use I made out of Fastlane+Gitlab, here is the original article I used as base :
https://about.gitlab.com/blog/2019/01/28/android-publishing-with-gitlab-and-fastlane/

# Screenshots

![Alt text](/screenshots/goingout_pipeline.png?raw=true "Pipeline")

It goes throught alpha automatically at each delivery (push), but then you can decide manually in one click to deliver on beta/prod.

<img src="/screenshots/goingout_action_alpha.png" width="200">

![Alt text](/screenshots/goingout_action_alpha.png?raw=true "Pipeline" width="200")
![Alt text](/screenshots/goingout_action_beta.png?raw=true "Pipeline" width="200")
![Alt text](/screenshots/goingout_action_prod.png?raw=true "Pipeline" width="200")



