//
//  ViewController.swift
//  CameraTest
//
//  Created by Lia An on 10/21/24.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var camera = UIImagePickerController()
    var picker: PHPickerViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        camera.sourceType = .camera
        camera.delegate = self
        
        var config = PHPickerConfiguration()
        config.selectionLimit = 1
        config.filter = .images
        
        picker = PHPickerViewController(configuration: config)
        picker?.delegate = self
        
    }

    @IBAction func actPhoto(_ sender: Any) {
        
        
        let sheet = UIAlertController(title: "리소스 선택", message: "이미지 출처를 선택하세요", preferredStyle: .actionSheet)
        let actionCancel = UIAlertAction(title: "취소", style: .cancel)
        let actionAlbum = UIAlertAction(title: "Album", style: .default) { _ in self.present(self.picker!, animated: true)}
        let actionCamera = UIAlertAction(title: "Camera", style: .default) { _ in self.present(self.camera, animated: true)} // 클로저 안에는 무조건 self 를 붙여야 한다.
        sheet.addAction(actionCancel)
        sheet.addAction(actionAlbum)
        sheet.addAction(actionCamera)

        present(sheet, animated: true, completion: nil) // 클로저 밖이니까 self 가 필요 없다
    }
    
}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        imageView.image = image
        dismiss(animated: true)
    }
}

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        guard let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) else { return }
        itemProvider.loadObject(ofClass: UIImage.self) { result, error in
            if let image = result as? UIImage {
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
                
            }
        }
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}


