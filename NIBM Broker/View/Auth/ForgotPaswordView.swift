//
//  ForgotPaswordView.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-03.
//

import SwiftUI

struct ForgotPaswordView: View {
    
    @State var password = ""
    @State var cPassword = ""
    
    var body: some View {
        VStack{
            VStack{
                Image("ForgotPw")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 100)
                
                Text("Reset Password")
                    .foregroundColor(Color.blue)
                    .font(Font.custom("Noteworthy", size: 30))
                    .bold()
                    .padding()
                
                Text("Set the new password for your account so you can login and access your all features")
                    .foregroundColor(Color.black)
                    .font(Font.custom("papyrus", size: 20))
                    .bold()
                    .padding()
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 15){
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(20)
                
                SecureField("Confirm Password", text: $cPassword)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(20)
         
            }
            .padding([.leading, .trailing], 27.5)
            
            
            Button(action: {
                
            }, label: {
                Text("Change Password")
                    //.font(Font.custom("Vardana", size: 25))
                    .foregroundColor(Color.cyan)
                    .frame(width: 200, height: 50)
                    .background(Color.white)
            })
                .cornerRadius(20)
            Spacer()
        }
        .background(
          LinearGradient(gradient: Gradient(colors: [.white, .cyan]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all))
    }
    
}

struct ForgotPaswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPaswordView()
    }
}
