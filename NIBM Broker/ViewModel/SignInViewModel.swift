//
//  SignInViewModel.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-16.
//

import Foundation
import FirebaseAuth
import SwiftUI


class SignInViewModel: ObservableObject{
    
//    @Binding var email: String
//    @Binding var password: String

    func signIn(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
            }else {
                HomeAutorizedView()
            }
        }
    }
}
