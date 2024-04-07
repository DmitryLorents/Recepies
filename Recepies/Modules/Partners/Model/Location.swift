// Location.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import GoogleMaps

/// Markers info on map
struct Location {
    /// Location of Moscow city
    static let moscowCoordinates = CLLocationCoordinate2D(latitude: 55.753215, longitude: 37.622504)
    /// Kaluga city coordinates
    private let myCityCoordinates = CLLocationCoordinate2D(latitude: 54.5293, longitude: 36.2754)
    /// Corrdinates for initial loading of map
    private let initialCoordinates = CLLocationCoordinate2D(latitude: 55.753215, longitude: 37.622504)
    /// Markers to be showed on view
    lazy var markers: [GMSMarker] = {
        let markers: [GMSMarker] = [
            .init(position: myCityCoordinates),
            .init(position: CLLocationCoordinate2DMake(54.53313159366181, 36.260332725942135)),
            .init(position: CLLocationCoordinate2DMake(54.53686791340813, 36.304609291255474)),
            .init(position: CLLocationCoordinate2DMake(54.51596642980143, 36.24647509306669)),
            .init(position: CLLocationCoordinate2DMake(54.52954901976637, 36.2995757907629)),
            .init(position: CLLocationCoordinate2DMake(54.51324263534372, 36.255344152450554)),
            .init(position: CLLocationCoordinate2DMake(54.51639809416409, 36.29265200346708))
        ]
        markers[0].title = "PROMOCOD30"
        markers[0].snippet = "30"
        markers[0].icon = GMSMarker.markerImage(with: .systemMint)

        markers[1].title = "PROMOCOD10"
        markers[1].snippet = "10"

        markers[2].title = "PROMOCOD20"
        markers[2].snippet = "20"

        markers[3].title = "PROMOCOD15"
        markers[3].snippet = "15"

        markers[4].title = "PROMOCOD23"
        markers[4].snippet = "23"

        markers[5].title = "PROMOCOD40"
        markers[5].snippet = "40"

        markers[6].title = "PROMOCOD33"
        markers[6].snippet = "33"

        return markers
    }()

    /// Return 2 variants of  location to be presented on map
    func getLocation(isIntialLocation: Bool) -> CLLocationCoordinate2D {
        isIntialLocation ? initialCoordinates : myCityCoordinates
    }
}
