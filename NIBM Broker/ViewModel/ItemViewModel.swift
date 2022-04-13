//
//  ItemViewModel.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-13.
//

import Foundation
import SwiftUI
import Firebase

struct ItemViewModel: UIViewControllerRepresentable{
    
    @Binding var selectedImage : UIImage?
    @Binding var isPickerShowing : Bool
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let imagePicker =  UIImagePickerController()
        
        imagePicker.sourceType = .photoLibrary
        
        //object that can recive UIImagePicker Controller events
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        return
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var parent: ItemViewModel
    
    init(_ picker: ItemViewModel){
        self.parent = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //Run code when the user has selected an image
        print("Image Selected")
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            DispatchQueue.main.async {
                self.parent.selectedImage = image
            }
        }
        //dismiss the picker
        parent.isPickerShowing = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Run code when the user has cancelle the picker UI
        print("Cancelled")
        
        //dismiss the picker
        parent.isPickerShowing = false
    }
}

