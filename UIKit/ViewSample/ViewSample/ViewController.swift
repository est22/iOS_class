//
//  ViewController.swift
//  ViewSample
//
//  Created by Lia An on 8/29/24.
//

import UIKit

class ViewController: UIViewController {
    // UISegmentedControl 객체
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var label1: UILabel!
    // UITextField 객체
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label2: UILabel!
    // UISlider 객체
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label3: UILabel!
    // UISwitch 객체
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var switch1: UISwitch!
    // UIStepper 객체
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var label5: UILabel!
    
    
    
    @IBAction func actChange(_ sender: Any) {
        label1.text = "\(segmentControl.selectedSegmentIndex+1)번째를 눌러주셨습니다."
        label1.textColor = .blue

    }

    @IBAction func didEndOnExit(_ sender: Any) {
        label2.text = textField.text
    }
    
    @IBAction func actSliderValueChange(_ sender: Any) {
        label3.text = "\(Int(slider.value))"
    }
    
    
    @IBAction func actSwitch(_ sender: Any) {
        if switch1.isOn{
            label4.text = "스위치가 켜졌습니다."
        } else {
            label4.text = "스위치가 꺼졌습니다."
        }
    }
    
    @IBAction func actStepperValueChange(_ sender: Any) {
        label5.text = "\(stepper.value)"
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // segment
        segmentControl.setTitle("네번째", forSegmentAt: 3)
        segmentControl.setEnabled(false, forSegmentAt: 2)
        segmentControl.selectedSegmentIndex = 1
        
        // slider
        slider.maximumValue = 100
        slider.minimumValue = -100
        slider.value = 0
        

        
        // stepper
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.stepValue = 0.2
        stepper.value = 0
        
        
        
    }

}

