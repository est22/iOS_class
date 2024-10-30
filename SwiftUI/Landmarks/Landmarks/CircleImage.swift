//
//  CircleImage.swift
//  Landmarks
//
//  Created by Lia An on 10/30/24.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock").clipShape(Circle())
            .overlay {
                Circle().stroke(Color.white, lineWidth: 4)
            }.shadow(radius: 7)
    }
}

#Preview {
    CircleImage()
}
