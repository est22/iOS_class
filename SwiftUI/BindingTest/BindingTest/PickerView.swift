//
//  PickerView.swift
//  BindingTest
//
//  Created by Lia An on 10/29/24.
//

import SwiftUI

enum Flavor: String {
    case chocolate, vanilla, strawberry
}
struct PickerView: View {
    @State private var selectedFlavor: Flavor = .chocolate
    var body: some View {
        List{
            Text(selectedFlavor.rawValue)
            Picker("Flavor", selection:  $selectedFlavor){
                Text("Chocolate").tag(Flavor.chocolate)
                Text("Vanilla").tag(Flavor.vanilla)
                Text("Strawberry").tag(Flavor.strawberry)

            }
        }
    }
}

#Preview {
    PickerView()
}
