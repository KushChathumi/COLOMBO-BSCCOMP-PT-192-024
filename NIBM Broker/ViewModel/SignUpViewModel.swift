//
//  SignUpViewModel.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-16.
//

import SwiftUI
import Firebase
import FirebaseAuth


class SignUpViewModel: ObservableObject{
    
    var email: String = ""
    var password: String = ""
    
    @State var isLogingMode = false

    
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to create user: ", error.localizedDescription)
            }else {
                print("Successfully created user : \(result?.user.uid ?? "")")
                
            }
        }
    }
    
    func loginUser(){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to Loged user: ", error.localizedDescription)
            }else {
                print("Successfully login user : \(result?.user.uid ?? "")")

            }
        }
    }
    
    
//    let auth = Auth.auth()
    
    
    
    
    
//    var isSignedIn: Bool{
//        return auth.currentUser != nil
//    }
//
//    func signIn(email: String, password: String){
//        auth.signIn(withEmail: email, password: password) { result, error in
//            guard result != nil, error == nil else {
//                return
//            }
//        }
//    }
//
//    func signUp(email: String, password: String){
//        auth.createUser(withEmail: email, password: password) { result, error in
//            guard result != nil, error == nil else {
//                return
//            }
//        }
//    }
}

