//
//  ObservedObjectTest.swift
//  PropertyWrapperTest
//
//  Created by Lia An on 11/7/24.
//

import SwiftUI

struct ParentView: View { // 부모뷰
    @State private var count = 0
    var body: some View {
        Button {
            count += 1
        } label: {
            Text("State: \(count)")
        }
        MyView(viewModel: .init())
    }
    
}
final class MyViewModel: ObservableObject {
    @Published var count: Int = 0
    func increment() {
        count += 1
    }
}

struct MyView: View { // 자식뷰
//    @ObservedObject var viewModel = MyViewModel()
    // State가 업데이트되면 ObservedObject가 초기화됨.
    @StateObject var viewModel = MyViewModel()
    
    var body: some View {
        Button {
            viewModel.increment()
        } label: {
            Text("ObservedObject: \(viewModel.count)")
        }
    }
}

#Preview {
    ParentView()
}
