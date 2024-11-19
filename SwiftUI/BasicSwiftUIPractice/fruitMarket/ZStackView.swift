//
//  ZStackView.swift
//  fruitMarket
//
//  Created by Lia An on 11/17/24.
//

import SwiftUI

struct ZStackView: View {
    var body: some View {
        // Color.clear이나 Rectangle처럼 부모 뷰의 크기만큼 커지려는 확장성을 지닌 뷰를 Spacer 대신 이용
        ZStack {
            Color.clear // 컬러 그 자체도 하나의 뷰에 해당
            Text("Spacer").font(.title).background(Color.yellow)
        }.background(Color.blue)
    }
}

#Preview {
    ZStackView()
}
