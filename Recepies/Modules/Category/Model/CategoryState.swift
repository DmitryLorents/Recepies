// CategoryState.swift
// Copyright © RoadMap. All rights reserved.

/// Describes possible states for СategoryView
enum CategoryState {
    /// no data loaded, empty category data
    case initial
    /// data fetching in progress
    case loading
    /// category data loaded succesfully
    case data
    /// no data is loaded, error = nil
    case noData
    /// category data not loaded, error received
    case error(Error)
}
