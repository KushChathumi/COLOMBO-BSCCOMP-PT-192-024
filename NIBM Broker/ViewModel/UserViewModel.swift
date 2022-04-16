//
//  UserViewModel.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-15.
//

import SwiftUI
import Firebase
import FirebaseStorage

class UserViewModel: ObservableObject {
    
    @Published var list = [User]()
    
    func addData(nic: String, dob: NSDate, name: String, gender: String, mobile: String, email: String, password: String, location: String){
        
        let db = Firestore.firestore()
        
        db.collection("Users").addDocument(data: ["nic": nic, "dob": dob, "name": name,"gender": gender, "mobile": mobile, "email": email, "password": password, "location": location]) { error in
            if error == nil {
                //self.getData()
            }else {
                
            }
        }
    }
    
    func getData(){
        
        let db = Firestore.firestore()
        
        db.collection("Users").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map { d in
                            return User(id: d.documentID,
                                        nic: d["nic"] as? String ?? "",
                                        dob: d["dob"] as! String,
                                        name: d["name"] as? String ?? "",
                                        gender: d["gender"] as? String ?? "",
                                        mobile: d["mobile"] as? String ?? "",
                                        email: d["email"] as? String ?? "",
                                        password: d["password"] as? String ?? "",
                                        location: d["location"] as? String ?? "")
                        }
                    }
                }
            } else {
                //Handell error
            }
        }
    }
}
