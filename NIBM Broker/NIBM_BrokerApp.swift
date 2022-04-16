//
//  NIBM_BrokerApp.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-01.
//

import SwiftUI
import Firebase

@main
struct NIBM_BrokerApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
   // @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            
            let viewModel = SignInViewModel()
            Home()
//                .environmentObject(viewModel)
//            Signin()
//              .environmentObject(viewModel)

//            CreateItemView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool{
        
        FirebaseApp.configure()
        
        return true
    }
}
