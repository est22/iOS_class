//
//  ViewController.swift
//  PickerViewSample
//
//  Created by Lia An on 8/30/24.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerLabel: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    let bts = ["RM", "진", "슈가", "제이홉", "지민", "뷔", "정국"]
    let btsImages = ["bts1","bts2","bts3","bts4","bts5","bts6","bts7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // Row 내 텍스트
//        if component == 0 {
//            return bts[row]
//        } else {
//            return ""
//        }
        return ""
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2 // = return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // 4 rows for component 0, 6 rows for component 1
        component == 0 ? bts.count : btsImages.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerLabel.text = "컴포넌트 \(component), 로우 \(row) 선택함"
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        // Row 내 이미지
            let image = UIImage(named: btsImages[row])
            let imageView = UIImageView()
            imageView.image = image
            return imageView

    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        CGFloat(200)
    }
    
    
}
