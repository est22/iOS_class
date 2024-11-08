//
//  ObservableTestView.swift
//  PropertyWrapperTest
//
//  Created by Lia An on 11/7/24.
//

import SwiftUI

// class
class DemoData: ObservableObject {
    @Published var userCount: Int = 0
    @Published var newUser: String = ""
    
    init(){
        updateData()
    }
    
    func updateData() {
        userCount += 1
        newUser = "user \(userCount)"
    }
}
struct ObservableTestView: View {
    @ObservedObject var demoData: DemoData = DemoData()
    var body: some View {
        VStack {
            Text("userCount: \(demoData.userCount)")
            Text("newUser: \(demoData.newUser)").padding()
            Button(action: {
                demoData.updateData()
            }){
                Text("Enter new user")
            }
        }
    }
}

// @EnvironmentObject Test
struct EnvironmentObject1: View {
    @EnvironmentObject var demoData: DemoData
    var body: some View {
        VStack {
            Text("userCount: \(demoData.userCount)")
            Text("newUser: \(demoData.newUser)")
                .padding()
            Button(action: {
                demoData.updateData()
            }){
                
            }
        }
    }
}

struct EnvironmentObject2: View {
    @EnvironmentObject var demoData: DemoData
    var body: some View {
        VStack {
            Text("userCount: \(demoData.userCount)")
            Text("newUser: \(demoData.newUser)")
                .padding()
            Button(action: {
                demoData.updateData()
            }){
                
            }
        }
    }
}

struct EnvironmentView: View {
    let demoData = DemoData()
    var body: some View {
        VStack {
            EnvironmentObject1()
            EnvironmentObject2()
        }.environmentObject(demoData)
    }
}



#Preview {
    ObservableTestView()
}
