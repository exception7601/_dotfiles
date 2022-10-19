#!/bin/bash

# 
# ${1} path do projeto 
# ${2} path do <NAME>.xcodeproj/
# ${3} <SHEME> nome do app

export PROJECT_NAME=$(find . -name "*.xcodeproj"| sed 's|^./||' )
export SCHEME=${PROJECT_NAME%.*}

#xcodebuild -list -project 
xcodebuild -scheme $SCHEME SYMROOT="./" build && \
#ios-deploy --detect && \
ios-deploy --debug --bundle Debug-iphoneos/${SCHEME}.app

