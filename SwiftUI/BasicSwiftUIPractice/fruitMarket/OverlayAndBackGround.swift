//
//  OverlayAndBackGround.swift
//  fruitMarket
//
//  Created by Lia An on 11/17/24.
//

import SwiftUI

struct OverlayAndBackGround: View {
    var body: some View {
        Text("ZStack")
        ZStack {
            Rectangle().fill(.green).frame(width: 150, height: 150)
            Rectangle().fill(.yellow).frame(width: 150, height: 150).offset(CGSize(width: 10, height: 10)) // 나중거가 뷰 계층에서 상위!
        }.padding()
        
        // Overlay를 이용해 ZStack과 똑같이 구현
        Text("Overlay")
        Rectangle().fill(.green).frame(width: 150, height: 150)
            .overlay(
                Rectangle().fill(.yellow).offset(CGSize(width: 10, height: 10))
            ).padding()
        
        // Background: 위가 아니라 그 아래 방향으로 쌓아나감
        Text("Background")
        Rectangle().fill(.yellow).frame(width: 150, height: 150)
            .background(
                Rectangle().fill(.green).offset(CGSize(width: 10, height: 10))
            )
    }
}

#Preview {
    OverlayAndBackGround()
}
