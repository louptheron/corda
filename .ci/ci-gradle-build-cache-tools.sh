#!/bin/bash

source .ci/ci-gradle-build-cache-init.sh

# Tools
echo ":tools:blobinspector"
cd tools/blobinspector
time ../../gradlew --stacktrace -Dorg.gradle.daemon=${USE_GRADLE_DAEMON} -Dorg.gradle.caching.debug=${GRADLE_CACHE_DEBUG} clean test install --build-cache ${PERFORM_GRADLE_SCAN}

echo ":tools:bootstrapper"
cd ../bootstrapper
time ../../gradlew --stacktrace -Dorg.gradle.daemon=${USE_GRADLE_DAEMON} -Dorg.gradle.caching.debug=${GRADLE_CACHE_DEBUG} clean install --build-cache ${PERFORM_GRADLE_SCAN}

echo ":tools:demobench"
cd ../demobench
time ../../gradlew --stacktrace -Dorg.gradle.daemon=${USE_GRADLE_DAEMON} -Dorg.gradle.caching.debug=${GRADLE_CACHE_DEBUG} clean test install --build-cache ${PERFORM_GRADLE_SCAN}

echo ":tools:explorer"
cd ../explorer
time ../../gradlew --stacktrace -Dorg.gradle.daemon=${USE_GRADLE_DAEMON} -Dorg.gradle.caching.debug=${GRADLE_CACHE_DEBUG} clean test install --build-cache ${PERFORM_GRADLE_SCAN}

echo ":tools:network-bootstrapper"
cd ../network-bootstrapper
time ../../gradlew --stacktrace -Dorg.gradle.daemon=${USE_GRADLE_DAEMON} -Dorg.gradle.caching.debug=${GRADLE_CACHE_DEBUG} clean test jar --build-cache ${PERFORM_GRADLE_SCAN}

echo ":tools:shell"
cd ../shell
time ../../gradlew --stacktrace -Dorg.gradle.daemon=${USE_GRADLE_DAEMON} -Dorg.gradle.caching.debug=${GRADLE_CACHE_DEBUG} clean test integrationTest install --build-cache ${PERFORM_GRADLE_SCAN}

echo ":tools:shell-cli"
cd ../shell-cli
time ../../gradlew --stacktrace -Dorg.gradle.daemon=${USE_GRADLE_DAEMON} -Dorg.gradle.caching.debug=${GRADLE_CACHE_DEBUG} clean test install --build-cache ${PERFORM_GRADLE_SCAN}
