//
//  MapView.swift
//  Landmarks
//
//  Created by Lia An on 10/30/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 35.011_286, longitude: -116.166_868), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
    var body: some View {
        Map(initialPosition: .region(region))
    }
}

#Preview {
    MapView()
}
