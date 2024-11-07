//
//  SwiftUIView.swift
//  SwiftUI-UIKit1
//
//  Created by Lia An on 11/7/24.
//

import SwiftUI

struct LabelView: UIViewRepresentable {
    @Binding var text:String
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.text = text
    }
}

#Preview {
    LabelView(text: .constant("Hello, World"))
}
