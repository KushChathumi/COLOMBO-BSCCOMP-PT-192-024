//
//  Signin.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-02.
//

import SwiftUI
import Firebase

struct Signin: View {
    
    @StateObject private var registerVM = SignUpViewModel()
    
    @State var show = false
    
    
    var body: some View {
        NavigationView {
            VStack{
                VStack (alignment: .center, spacing: 5){
                    Text("NIBM Broker")
                        .foregroundColor(Color.blue)
                        .font(Font.custom("Noteworthy", size: 30))
                        .bold()
                        .padding()
                
                    Text("Sign in to continue")
                        .foregroundColor(Color.black)
                        .font(Font.custom("papyrus", size: 20))
                        .bold()
                        .padding()
  
                VStack (alignment: .leading, spacing: 15) {
                    TextField("User Name", text: $registerVM.email)
                        .frame(width: 325, height: 50)
                        .padding(.trailing,10)
                    //.padding(.leading,10)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(15)
                    
                    SecureField("Password", text: $registerVM.password)
                        .frame(width: 325, height: 50)
                        .padding(.trailing,10)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(15)
                    
                    HStack(alignment: .center, spacing: 5) {
                        Button(action: {
                            registerVM.loginUser()

                            
                        }, label: {
                            Text("Login")
                                .font(Font.custom("Vardana", size: 25))
                                .foregroundColor(Color.cyan)
                                .frame(width: 145, height: 50)
                                .background(Color.white)
                        })
                            .cornerRadius(25)
            
                        NavigationLink(destination: SginUpView(),
                                       label: {
                                           Text("Register")
                                               .font(Font.custom("Vardana", size: 25))
                                               .foregroundColor(Color.white)
                                               .frame(width: 145, height: 50)
                                               .background(Color.cyan)
                                               .cornerRadius(25)
                                       })
                    }
                    .padding()
                }
                .autocapitalization(.none)
                .padding()
                
                .fullScreenCover(isPresented: self.$show){
                    MainView()
                }
                    
                HStack(alignment: .center, spacing: 5){
                label: do {
                        Text("Forget Your Password")
                            .font(Font.custom("Vardana", size: 20))
                            .foregroundColor(Color.white)
                    }

                    NavigationLink(destination: ForgotPaswordView(), label: {
                        Text("Click Here!")
                            .font(Font.custom("Vardana", size: 20))
                            .foregroundColor(Color.blue)
                    })
                }
                }
                .padding()
                
                Spacer()
                
                Divider()
                    
                Button(action: {
                    
                },label: {
                        Text("Term & Privacy Policy")
                            .font(Font.custom("Vardana", size: 15))
                            .foregroundColor(Color.white)
                    })
                    .padding()
                
            }
            .background(
              LinearGradient(gradient: Gradient(colors: [.white, .cyan]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all))
    
        }
        //.padding(.top, 100.0)
      
    }    
}

struct Signin_Previews: PreviewProvider {
    static var previews: some View {
        Signin()
.previewInterfaceOrientation(.portrait)
    }
}
