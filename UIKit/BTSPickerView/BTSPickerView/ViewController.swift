//
//  ViewController.swift
//  BTSPickerView
//
//  Created by Lia An on 9/2/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // Properties
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    
    let btsImage = ["bts1", "bts2", "bts3", "bts4","bts5","bts6",
                    "bts7"]
    let bts = ["RM","진","슈가","제이홉","지민","뷔","정국"]
    let SFSymbolsImage = ["globe.americas.fill", "seal.fill", "touchid", "person.crop.square", "hands.and.sparkles","face.smiling", "bolt"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return btsImage.count
        } else { return SFSymbolsImage.count}
    }
        
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            100
        }
    
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        200
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView()

        if component == 0 {
            imageView.image = UIImage(named: btsImage[row])
            imageView.contentMode = .scaleAspectFit
        } else {
            imageView.image = UIImage(systemName: SFSymbolsImage[row])
            imageView.contentMode = .scaleAspectFit
            

        }
        return imageView
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            label.text = bts[row]
           
        }
    }
    
//    pickerView.selectedRow(inComponent: 0)
//    pickerView.selectRow(5, inComponent: 0, animated: true)
    
    
    @IBAction func actRoll(_ sender: Any) {
        picker.selectRow(5, inComponent: 0, animated: true)
    }
    

}

