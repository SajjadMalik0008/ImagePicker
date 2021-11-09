//
//  ImagePicker.swift
//  ImagePicker-SwiftUI
//
//  Created by devadmin on 09.11.21.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image : UIImage
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(imagePicker: self)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let imagePicker: ImagePicker
        init(imagePicker: ImagePicker) {
            self.imagePicker = imagePicker
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                guard let data = image.jpegData(compressionQuality: 0.2),let compresedImage = UIImage(data: data) else { return }
                imagePicker.image = compresedImage
            }
            
            picker.dismiss(animated: true)
        }
    }
}
