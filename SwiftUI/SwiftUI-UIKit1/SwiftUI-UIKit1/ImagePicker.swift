//
//  ImagePicker.swift
//  SwiftUI-UIKit1
//
//  Created by Lia An on 11/7/24.
//

import SwiftUI
import PhotosUI

// 1. Coordinator
class ImagePickerCoordinator: NSObject, PHPickerViewControllerDelegate {
    // 3.Declare the parent property to hold a reference to the ImagePicker
    var parent: ImagePicker?
    // Initialize the coordinator with a reference to the ImagePicker
    init(parent:ImagePicker){
        self.parent = parent
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // 2.
        guard let itemProvider = results.first?.itemProvider else { return }
        if itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                if let image = image as? UIImage {
                    self?.parent?.image = image
                }
                
            }
        }
        picker.dismiss(animated: true)
    }
    
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 1
        let picker = PHPickerViewController(configuration: config)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        uiViewController.delegate = context.coordinator
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        ImagePickerCoordinator(parent: self)
    }
}

struct ImagePickerView:View {
    @State var isPresented: Bool = false
    @State var image: UIImage?
    var body: some View {
        VStack{
            if let image{
                Image(uiImage: image).resizable().frame(width: 300 , height: 300)
            }
            Button("PickerView"){
                isPresented.toggle()
            }.sheet(isPresented: $isPresented) {
                ImagePicker(image: $image)
            }
        }
    }
}

#Preview {
    ImagePickerView()
}
