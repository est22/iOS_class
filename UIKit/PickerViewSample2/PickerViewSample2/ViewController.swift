//
//  ViewController.swift
//  PickerViewSample2
//
//  Created by Lia An on 9/2/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate  {
    

    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(component) | \(row)"
    }
    
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        component == 0 ? 300 : 100
//    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        200
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        
        // reusing
        // view를 UIImageView로 형변환(실패할수도 있으니 as?로 옵셔널 만들기)
        if let imageView = view as? UIImageView { // 값이 있으면: 객체 인스턴스의 참조값을 넘김
            imageView.image = UIImage(systemName: "heart.fill")
            return imageView
        } else { // 값이 없으면: 새로 만든다
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(systemName: "person.3")
            view?.addSubview(imageView)
            return imageView
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        4
    }
    

    

}

