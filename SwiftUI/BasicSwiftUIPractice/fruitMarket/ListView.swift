//
//  ListView.swift
//  fruitMarket
//
//  Created by Lia An on 11/17/24.
//

import SwiftUI

//struct User {
//    var name: String
//}
struct ListView: View {
    let fruits = ["Apple", "Banana", "Orange", "Pear"]
    var body: some View {
        List {
            Text("1")
            Text("List").font(.largeTitle)
//            Image("smile")
            Circle().frame(width:100, height: 100)
            Color(.red).frame(width: 100, height:100)
        }
        
        List(0..<10) {
            Text("\($0)")
        }
        
        List(["A","B","C","D","E"], id: \.self) {
            Text($0)
        }
        List([1,2,3,4,5], id: \.hashValue) {
            Text("\($0)")
        }
        
        List {
            Text("번호")
            ForEach(0..<4) {
                Text("\($0)")
            }
        }
        
        List {
            Text("Fruits").font(.largeTitle)
            ForEach(fruits, id: \.self){
                Text($0)
            }
        }
        
//        List([User(User(name:"Steve"), User(name:"John"), User(name:"Mike"))], id: \.name){
//            Text("\($0.name)")
//        }
        
        
    }
}

#Preview {
    ListView()
}
