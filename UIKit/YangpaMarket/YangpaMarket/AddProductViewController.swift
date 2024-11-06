//
//  AddProductViewController.swift
//  YangpaMarket
//
//  Created by Lia An on 11/6/24.
//

import UIKit
import PhotosUI
import Alamofire
import Kingfisher

class AddProductViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtDesc: UITextField!
    
    var camera: UIImagePickerController?
    var picker: PHPickerViewController?
    
    override func viewDidLoad() {
        
            super.viewDidLoad()
            camera = UIImagePickerController()
            camera?.sourceType = .camera
            camera?.delegate = self
            
           // configuration
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
        let actionCamera = UIAlertAction(title: "Camera", style: .default) { _ in self.present(self.camera!, animated: true)} // 클로저 안에는 무조건 self 를 붙여야 한다.
        sheet.addAction(actionCancel)
        sheet.addAction(actionAlbum)
        sheet.addAction(actionCamera)

        present(sheet, animated: true, completion: nil) // 클로저 밖이니까 self 가 필요 없다
    }
    
    
    
    @IBAction func actRegister(_ sender: Any) {
        let endPoint = "\(host)/sales"
        guard let imageData = imageView.image?.jpegData( compressionQuality: 0.8) else { return }
        let formData = MultipartFormData()
        formData.append(imageData, withName: "photo", fileName: "photo.jpg", mimeType: "image/jpeg")
        formData.append(txtName.text!.data(using: .utf8)!, withName: "productName")
        formData.append(txtDesc.text!.data(using: .utf8)!, withName: "description")
        formData.append(txtPrice.text!.data(using: .utf8)!, withName: "price")
        
        let userDefault = UserDefaults.standard
        let userName = userDefault.string(forKey: "userName")
        formData.append(userName!.data(using: .utf8)!, withName: "userName")
        
        // user token (login)
        guard let token = userDefault.string(forKey: "token") else { return }
        // header
        let headers: HTTPHeaders = [
            "Authorization":"Bearer \(token)",
            "Content-Type":"multipart/form-data",
        ]
        
        AF.upload(multipartFormData: formData, to: endPoint, headers: headers).responseDecodable(of: ProductList.self) { response in
            switch response.result {
            case .success(let productList):
                let alert = UIAlertController(title: "상품등록", message: productList.message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .default) { _ in
                    self.navigationController?.popViewController(animated: true)}
                alert.addAction(action)
                self.present(alert, animated: true)
            case .failure(let error):
                print(error.localizedDescription)
            }

            
        }
    }
}



extension AddProductViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        imageView.image = image
        dismiss(animated: true)
    }
}


extension AddProductViewController: PHPickerViewControllerDelegate {
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
        picker.dismiss(animated: true)
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}



