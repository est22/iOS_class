//
//  ColorPickerView.swift
//  BindingTest
//
//  Created by Lia An on 10/29/24.
//

import SwiftUI

struct ColorPickerView: View {
    @State var selected:Color = Color.green
    var body: some View {
        VStack {
            Spacer()
            Circle().foregroundColor(selected)
            Spacer()
            ColorPicker(selection: $selected, label: {
                Text("배경색을 선택하시오.")
            })
            .padding()
        }
    }
}

#Preview {
    ColorPickerView()
}
