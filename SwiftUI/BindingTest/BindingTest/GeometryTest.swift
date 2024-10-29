//
//  GeometryTest.swift
//  BindingTest
//
//  Created by Lia An on 10/30/24.
//

import SwiftUI
// 차지할 수 있는 공간에 대한 정보
struct GeometryTest: View {
    var body: some View {
        GeometryReader { reader in
            Text("Geometry Reader").onAppear {
                print("\(reader.size.width):\(reader.size.height)")
            }
        }
        GeometryReader { reader in
            Text("Geometry Reader").onAppear {
                print("\(reader.size.width):\(reader.size.height)")
            }
        }
        
    }
}

#Preview {
    GeometryTest()
}
