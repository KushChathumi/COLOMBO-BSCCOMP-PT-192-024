//
//  Authentication.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-17.
//

import SwiftUI

class Authentication: ObservableObject{
    
    @Published var isValidated = false
    
    func updateValidation(success: Bool){
        withAnimation{
            isValidated = success
        }
    }
}

