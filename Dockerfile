
FROM openjdk:8

MAINTAINER ClementMAHE <mahe.clem@gmail.com>

ENV ANDROID_SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip" \
    GRADLE_HOME="/usr/share/gradle" \
    ANDROID_HOME="/opt/android"

ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/$ANDROID_BUILD_TOOLS_VERSION:$GRADLE_HOME/bin

WORKDIR /opt

RUN dpkg --add-architecture i386 && \
  apt-get -qq update && \
  apt-get -qq install -y wget curl maven ant gradle libncurses5:i386 libstdc++6:i386 zlib1g:i386 && \

  # Installs Android SDK
  mkdir android && cd android && \
  wget -O tools.zip ${ANDROID_SDK_URL} && \
  unzip tools.zip && rm tools.zip && \

  # Copy licenses
  mkdir -p licenses && \
  echo 8933bad161af4178b1185d1a37fbf41ea5269c55 > licenses/android-sdk-license && \
  echo 84831b9409646a918e30573bab4c9c91346d8abd > licenses/android-sdk-preview-license && \

  # Install
  echo "Installing apk..." && \
  sdkmanager "platforms;android-25" \
             "build-tools;25.0.3" \
             "extras;google;google_play_services" \
             "extras;google;m2repository" \
             "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0-beta5" \
             "system-images;android-25;google_apis;x86" \
             "emulator" --verbose && \
  echo "Installed apk done" && \

  #Install package emulator dependencies
  echo y | apt-get install apt-utils binutils cpp cpp-4.9 dh-python dpkg-dev fakeroot g++ g++-4.9 gcc \
  gcc-4.9 init-system-helpers iso-codes libalgorithm-diff-perl  \
  libalgorithm-diff-xs-perl libalgorithm-merge-perl libapt-inst1.5 libasan1    \
  libatomic1 libc-dev-bin libc6-dev libcilkrts5 libcloog-isl4 libdpkg-perl  \
  libfakeroot libfile-fcntllock-perl libgcc-4.9-dev libgomp1 libisl10 libitm1   \
  liblsan0 libmpc3 libmpdec2 libmpfr4 libpython3-stdlib libpython3.4-minimal  \
  libpython3.4-stdlib libquadmath0 libreadline6-dev libssl-doc    \
  libstdc++-4.9-dev libtimedate-perl libtinfo-dev libtsan0 libubsan0    \
  libxslt1.1 libyaml-0-2 linux-libc-dev lsb-release make manpages manpages-dev  \
  patch python-apt python-apt-common python3 python3-apt python3-minimal  \
  python3.4 python3.4-minimal unattended-upgrades    && \

  echo "Installed packages for emulator done" && \

  # Create AVD - echo no to avoid setting a hardware profile and use the default one
  #avdmanager create avd -f -n emulatorApi25 -k "system-images;android-25;google_apis;x86" -g "google_apis" && \
  echo "no" | avdmanager create avd --name "Test-Emulator-API23-Nexus-5-0" --package "system-images;android-25;google_apis;x86" --device "Nexus 5X" --tag "google_apis" --abi "x86"  && \

  chmod a+x -R $ANDROID_HOME && \
  chown -R root:root $ANDROID_HOME && \

  #Install fastlane
  echo n | apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev && \
  echo y | apt-get install ruby-dev && \
  echo y | apt-get install rubygems && \
  sudo echo y | gem install fastlane -NV && \

  # Clean up
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  apt-get autoremove -y && \
  apt-get clean \
