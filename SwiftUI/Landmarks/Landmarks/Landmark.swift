//
//  Landmark.swift
//  Landmarks
//
//  Created by Lia An on 10/30/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Codable {
        var latitude: Double
        var longitude: Double
    }
}


