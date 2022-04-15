//
//  ItemViewModel.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-13.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseStorage

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

class Item_ViewModel: ObservableObject {
    
    @Published var list = [Advertisment]()
    
    func addData(item_type: String, item_cost: String, item_size: String,item_district: String, item_town: String, item_image: String, item_contact: String){
        let db = Firestore.firestore()
        
        db.collection("Items").addDocument(data: ["item_type": item_type, "item_cost": item_cost, "item_size": item_size, "item_district": item_district, "item_town": item_town, "item_image": item_image, "item_contact": item_contact]) { error in
            if error == nil {
                self.getData()
            }else {
                
            }
        }
    }
    
    func getData(){
        
        let db = Firestore.firestore()
        
        db.collection("Items").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map { d in
                            return Advertisment(id: d.documentID,
                                                item_type: d["item_type"] as? String ?? "",
                                                item_cost: d["item_cost"] as? String ?? "",
                                                item_size: d["item_size"] as? String ?? "",
                                                item_image: d["item_image"] as? String ?? "",
                                                item_district: d["item_district"] as? String ?? "",
                                                item_town: d["item_town"] as? String ?? "",
                                                item_contact: d["item_contact"] as? String ?? "")
                        }
                    }
                }
            } else {
                //Handell error
            }
        }
    }
    
    func deleteData( advertismentToDelete: Advertisment){
        let db = Firestore.firestore()
        db.collection("Items").document(advertismentToDelete.id).delete { error in
            if error == nil {
                DispatchQueue.main.async {
                    self.list.removeAll { advertisment in
                        return advertisment.id == advertismentToDelete.id
                    }
                }
            }
        }
    }
}
