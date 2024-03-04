// TypeAlias.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// swiftlint:disable all
public typealias VoidHandler = () -> ()
public typealias BoolHandler = (Bool) -> ()
public typealias StringHandler = (String) -> ()
public typealias DateHandler = (Date) -> ()
public typealias OptionalDateHandler = (Date?) -> ()
public typealias SortingHandler = (Int, Int) -> Bool // <T: Comparable> = (T, T) -> Bool
// swiftlint:enable all
