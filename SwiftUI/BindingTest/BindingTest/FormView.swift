//
//  FormView.swift
//  BindingTest
//
//  Created by Lia An on 10/29/24.
//

import SwiftUI

struct FormView: View {
    enum Notification: String{
        case Sound="소리", Vibrate="진동", Silent="무음"
    }
    @State var isOn = false
    @State var selectedNotification: Notification = .Sound
    @State var selected: String?
    
    var body: some View {
        NavigationView{
            Form {
                Section("Menu1") {
                    Picker("알림", selection: $selectedNotification) {
                        Text(Notification.Sound.rawValue).tag(Notification.Sound)
                        Text(Notification.Vibrate.rawValue).tag(Notification.Vibrate)
                        Text(Notification.Silent.rawValue).tag(Notification.Silent)
                    }
                }
                Section("Menu2"){
                    Toggle("Play notification sounds", isOn: $isOn)
                }
                Section(header: Text("Menu3")){
                    Text("DM")
                    Text("Mentions")
                    Text("Anything")
                }
            }
        }
    }
}

#Preview {
    FormView()
}
