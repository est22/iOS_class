//
//  AddImageViewController.swift
//  PListTest
//
//  Created by Lia An on 10/21/24.
//

import UIKit
import PhotosUI

class AddImageViewController: UIViewController {

    @IBOutlet weak var txtDesc: UITextField!
    @IBOutlet weak var txtNick: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var camera: UIImagePickerController?
    var picker: PHPickerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        camera = UIImagePickerController()
        
        var config = PHPickerConfiguration()
        config.selectionLimit = 3
        config.filter = .images
        
        picker = PHPickerViewController(configuration: config)

    }
    
    @IBAction func actPhoto(_ sender: Any) {
        let sheet = UIAlertController(title: "리소스 선택", message: "이미지 출처를 선택하세요", preferredStyle: .actionSheet)
        let actionCancel = UIAlertAction(title: "취소", style: .cancel)
        let actionAlbum = UIAlertAction(title: "Album", style: .default) { _ in self.present(self.picker!, animated: true)}
        let actionCamera = UIAlertAction(title: "Camera", style: .default) { _ in self.present(self.camera!, animated: true)} // 클로저 안에는 무조건 self 를 붙여야 한다.
        sheet.addAction(actionCancel)
        sheet.addAction(actionAlbum)
        sheet.addAction(actionCamera)

        present(sheet, animated: true, completion: nil) // 클로저 밖이니까 self 가 필요 없다
    }
    
    @IBAction func actSave(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


