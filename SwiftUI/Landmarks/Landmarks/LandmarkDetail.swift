//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Lia An on 10/30/24.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate).frame(height: 300)
            CircleImage(image: landmark.image).offset(y:-130).padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title.bold())
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }.font(.subheadline)
                    .foregroundStyle(.secondary)
                Divider()
                Text("About \(landmark.name)").font(.title2)
                Text(landmark.description)
            }.padding()
            Spacer()
        }
    }
}

#Preview {
    LandmarkDetail(landmark: landmarks[1])
}
