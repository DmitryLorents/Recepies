#!/bin/zsh

pkill -x Xcode
rm -rf Recepies.xcodeproj Recepies.xcworkspace
xcodegen
pod install
open Recepies.xcworkspace
