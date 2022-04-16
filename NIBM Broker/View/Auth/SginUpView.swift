//
//  SginUpView.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-03.
//

import SwiftUI
import Firebase

struct SginUpView: View {
    
    @StateObject private var registerVM = SignUpViewModel()
    
    @ObservedObject var userModel = UserViewModel()
    
    @State var nic = ""
    @State var dob = ""
    @State var name = ""
    @State var gender = ""
    @State var mobile = ""
    @State var email = ""
    @State var password = ""
    @State var cPassword = ""
    @State var location = ""
        
        @EnvironmentObject var viewModel: SignInViewModel

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
                            
                            TextField("Gender", text: $gender)
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
                            
                            TextField("Email Address", text: $registerVM.email)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(20)
                            
                            SecureField("Password", text: $registerVM.password)
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
                        //register()
                        registerVM.register()
                        userModel.addData(nic: nic, dob: dob, name: name,gender: gender, mobile: mobile, email: registerVM.email, password: registerVM.password, location: location)
                    
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
                .onAppear{
                
                }
                
            }
    
    private func clearFormField() {
        nic = ""
        dob = ""
        name = ""
        gender = ""
        mobile = ""
        email = ""
        password = ""
        cPassword = ""
        location = ""
    }
    
    private func register(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to create user: ", error.localizedDescription)
            }else {
                print("Successfully created user : \(result?.user.uid ?? "")")
            }
        }
    }
}
    


struct SginUpView_Previews: PreviewProvider {
    static var previews: some View {
        SginUpView()
    }
}
