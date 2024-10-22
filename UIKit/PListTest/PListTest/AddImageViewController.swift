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
    
    var bts: NSMutableArray?
    var camera: UIImagePickerController?
    var picker: PHPickerViewController?
    
    fileprivate func setupKeyboardEvent() {
        NotificationCenter.default.addObserver(self, selector: #selector (keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        camera = UIImagePickerController()
        camera?.sourceType = .camera
        camera?.delegate = self
        
        var config = PHPickerConfiguration()
        config.selectionLimit = 3
        config.filter = .images
        
        picker = PHPickerViewController(configuration: config)
        picker?.delegate = self
        let targetURL = urlWithFileName("bts.plist")
        bts = try? NSMutableArray(contentsOf: targetURL, error: ())
        
        setupKeyboardEvent()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGesture)

    }
    
    @IBAction func actPhoto(_ sender: Any) {
        let alert = UIAlertController(title: "리소스 선택", message: "이미지 출처를 선택하세요", preferredStyle: .actionSheet)
        let actionCancel = UIAlertAction(title: "취소", style: .cancel)
        let actionAlbum = UIAlertAction(title: "Album", style: .default) { _ in self.present(self.picker!, animated: true)}
        let actionCamera = UIAlertAction(title: "Camera", style: .default) { _ in self.present(self.camera!, animated: true)} // 클로저 안에는 무조건 self 를 붙여야 한다.
        alert.addAction(actionCancel)
        alert.addAction(actionAlbum)
        alert.addAction(actionCamera)

        present(alert, animated: true, completion: nil) // 클로저 밖이니까 self 가 필요 없다
    }
    
    @IBAction func actSave(_ sender: Any) {
        let imageName: String? = UUID().uuidString + ".png"
        let newMember = ["nick":txtNick.text, "desc": txtDesc.text, "image": imageName]
        bts?.add(newMember)
        let target = urlWithFileName("bts.plist")
        try? bts?.write(to: target)
        
        guard let image = imageView.image,
                let data: Data = image.jpegData(compressionQuality: 0.8) else { return }
        let fileURL = urlWithFileName(imageName!, type: .png)
        try? data.write(to: fileURL)
        print(fileURL)
        
        performSegue(withIdentifier: "back", sender: nil)
    }
    
    // 뷰에 focus가 오면 키보드가 나타남(first responder)
    // 키보드가 내려갈때: first responder가 아니게 되면 내려감
    @IBAction func txtEndEditing(_ sender: UITextField) {
//        sender.resignFirstResponder()
        view.endEditing(true) // 키보드가 내려갈 때 텍스트 필드의 입력 종료
    }
    
    @objc func viewTapped() {
        view.endEditing(true) // 배경 클릭 시 키보드 내리기
    }
    
    @objc func keyboardWillShow(_ sender: Notification){
        view.frame.origin.y = -200
    }
    
    @objc func keyboardWillHide(_ sender: Notification){
        view.frame.origin.y = 0
        
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

extension AddImageViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate, PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        guard let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) else { return }
        itemProvider.loadObject(ofClass: UIImage.self) { result, _ in
            if let image = result as? UIImage {
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
                
            }
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        } // info 매개변수 보면, Any 타입이기 때문에 우리가 원하는 UIImage타입으로 형변환
        picker.dismiss(animated: true)
    }
    
    
    
    
}
