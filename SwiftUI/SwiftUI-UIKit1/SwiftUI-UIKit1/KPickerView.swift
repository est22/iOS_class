//
//  KPickerView.swift
//  SwiftUI-UIKit1
//
//  Created by Lia An on 11/7/24.
//

import SwiftUI
import UIKit

// 1. 구조체 생성 후 프로토ㅗㄹ
struct KPickerView: UIViewRepresentable {
    // 3.
    func makeUIView(context: Context) -> UIPickerView {
        UIPickerView()
    }
    // 4.
    func updateUIView(_ uiView: UIPickerView, context: Context) {
        uiView.delegate = context.coordinator
        uiView.dataSource = context.coordinator
    }
    // 5.
    func makeCoordinator() ->  PickerViewCoordinator {
        PickerViewCoordinator()
    }
    
    
}

// 2. Coordinator 생성
class PickerViewCoordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(row)번째 row"
    }
    
    
}

#Preview {
    KPickerView()
}
