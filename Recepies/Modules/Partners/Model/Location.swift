// Location.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import GoogleMaps

struct Location {
    private let myCityCoordinates = CLLocationCoordinate2D(latitude: 54.5293, longitude: 36.2754)
    private let initialCoordinates = CLLocationCoordinate2D(latitude: 55.753215, longitude: 37.622504)
    lazy var markers: [GMSMarker] = {
        let markers: [GMSMarker] = [
            .init(position: myCityCoordinates),
            .init(position: CLLocationCoordinate2DMake(54.538048439192146, 36.25248324126005)),
            .init(position: CLLocationCoordinate2DMake(54.53877864022235, 36.289962753653526)),
            .init(position: CLLocationCoordinate2DMake(54.53150794748612, 36.25460051000119)),
            .init(position: CLLocationCoordinate2DMake(54.52954901976637, 36.2995757907629)),
            .init(position: CLLocationCoordinate2DMake(54.51324263534372, 36.255344152450554)),
            .init(position: CLLocationCoordinate2DMake(54.51639809416409, 36.29265200346708))
        ]
        markers[0].icon = GMSMarker.markerImage(with: .systemMint)
        return markers
    }()

    func getLocation(isIntialLocation: Bool) -> CLLocationCoordinate2D {
        isIntialLocation ? initialCoordinates : myCityCoordinates
    }
}
