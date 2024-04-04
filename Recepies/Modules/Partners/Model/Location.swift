// Location.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import GoogleMaps

struct Location {
    let myCityCoordinates = CLLocationCoordinate2D(latitude: 54.5293, longitude: 36.2754)
    let initialCoordinates = CLLocationCoordinate2D(latitude: 55.753215, longitude: 37.622504)

    func getLocation(isIntialLocation: Bool) -> CLLocationCoordinate2D {
        isIntialLocation ? initialCoordinates : myCityCoordinates
    }
}
