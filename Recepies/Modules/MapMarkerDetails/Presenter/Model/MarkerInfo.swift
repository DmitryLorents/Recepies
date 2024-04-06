// MarkerInfo.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import GoogleMaps

/// Data for MapMarkerDetailsView labels
struct MarkerInfo {
    /// Name of place
    let placeName: String
    /// Adress of place
    let adress: String
    /// Amount of discount
    let discountAmount: Int
    /// Promocode word
    let promocode: String

    init(placeName: String?, adress: String?, discountAmount: Int?, promocode: String?) {
        self.placeName = placeName ?? "No place name"
        self.adress = adress ?? "No place adress"
        self.discountAmount = discountAmount ?? 0
        self.promocode = promocode ?? "No promocode"
    }
}
