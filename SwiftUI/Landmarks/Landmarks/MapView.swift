//
//  MapView.swift
//  Landmarks
//
//  Created by Lia An on 10/30/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
    var body: some View {
        Map(initialPosition: .region(region))
    }
}

#Preview {
    MapView(coordinate: landmarks[0].locationCoordinate)
}
