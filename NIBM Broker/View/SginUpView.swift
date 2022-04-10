//
//  SginUpView.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-03.
//

import SwiftUI

struct SginUpView: View {
    
    @State var nic = ""
    @State var dob = ""
    @State var name = ""
    @State var mobile = ""
    @State var email = ""
    @State var password = ""
    @State var cPassword = ""
    @State var location = ""
        
        @EnvironmentObject var viewModel: AppViewModel

        var body: some View {
            
                VStack (alignment: .center, spacing: 18){
                    Text("Sign Up")
                       .foregroundColor(Color.blue)
                    .font(Font.custom("Noteworthy", size: 30))
                      .bold()

                    ScrollView {
                    VStack{
                        VStack (alignment: .leading, spacing: 8) {

                            TextField("Name", text: $nic)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(20)
                                .disableAutocorrection(true)
                            
                            TextField("Gender", text: $nic)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(20)
                                .disableAutocorrection(true)
                            
                            TextField("NIC Number", text: $dob)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(20)
                            
                            TextField("Date of Birth", text: $name)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(20)
                            
                            TextField("Mobile Number", text: $mobile)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(20)
                            
                            TextField("Email Address", text: $email)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(20)
                            
                            SecureField("Password", text: $password)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(20)
                            
                            SecureField("Confirm Password", text: $cPassword)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(20)
                            
                            TextField("Current Location", text: $location)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(20)
                            
                        }
                        .padding([.leading, .trailing], 27.5)
                    }
                    
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Register")
                            .font(Font.custom("Vardana", size: 25))
                            .foregroundColor(Color.cyan)
                            .frame(width: 150, height: 50)
                            .background(Color.white)
                            .cornerRadius(20)
                    })
                    }
                    Spacer()
                }
                    
                .background(
                  LinearGradient(gradient: Gradient(colors: [.white, .cyan]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
                
            }
        
        }
    


struct SginUpView_Previews: PreviewProvider {
    static var previews: some View {
        SginUpView()
    }
}
