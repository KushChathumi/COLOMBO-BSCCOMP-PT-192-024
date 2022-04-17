//
//  SignUpViewModel.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-16.
//

import SwiftUI
import Firebase
import FirebaseAuth
import CoreLocation


class SignUpViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var email: String = ""
    var password: String = ""
    
    @State var isLogingMode = false
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                if self.email.isEmpty{
                    print("Please Enter Email Address")
                }
                if self.password.isEmpty{
                    print("Please Enter Pasword")
                }else {
                    print("Failed to create user: ", error.localizedDescription)
                }
            }else {
                self.isLogingMode = true
                print("Successfully created user : \(result?.user.uid ?? "")")   
            }
        }
    }

    func loginUser(){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                if self.email.isEmpty{
                    print("Please Enter Email Address")
                }
                if self.password.isEmpty{
                    print("Please Enter Pasword")
                }else {
                    print("Failed to create user: ", error.localizedDescription)
                }
//                self.isLogingMode = false
//                print("Failed to Loged user: ", error.localizedDescription)
            }else {
                self.isLogingMode = true
                print("Successfully login user : \(result?.user.uid ?? "")")
                print("isLogingMode : \(self.isLogingMode)")


            }
        }
    }
    
    private func clearFormField() {
        email = ""
        password = ""

    }
}
    
    
    
    
    
    
    
    
    

//        func signIn(completion: @escaping (Bool) -> Void){
//            Auth.auth().signIn(withEmail: email, password: password) { success, error in
//                switch success{
//                case .success:
//                    completion(true)
//                case .error:
//                    completion(false)
//                }
//        }
    
    
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
    
    


