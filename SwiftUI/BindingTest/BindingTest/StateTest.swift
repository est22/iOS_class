//
//  StateTest.swift
//  BindingTest
//
//  Created by Lia An on 10/29/24.
//

import SwiftUI

struct StateTest: View {
    @State var isWifiEnabled: Bool = true
    @State var name = ""
    var body: some View {
        VStack {
            Toggle(isOn: $isWifiEnabled) {
                Text("Enable Wi-Fi")
                
            }
            WifiImageView(wifiEnabled: $isWifiEnabled)
            
            TextField("이름을 입력하세요", text: $name)
        }
    }
    
}

struct WifiImageView: View {
    @Binding var wifiEnabled: Bool
    var body: some View {
        Image(systemName: wifiEnabled ? "wifi" : "wifi.slash").resizable().frame(width: 110, height: 100)
    }
}
#Preview {
    StateTest()
}
