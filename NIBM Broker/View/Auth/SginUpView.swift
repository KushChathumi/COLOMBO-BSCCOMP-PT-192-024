//
//  SginUpView.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-03.
//

import SwiftUI
import Firebase
import CoreLocation

struct SginUpView: View {
    
    @StateObject private var registerVM = SignUpViewModel()
    @State var manager = CLLocationManager()
    @ObservedObject var userModel = UserViewModel()
    @StateObject private var HomeModel = HomeViewModel()
    
    @State var nic = ""
    @State var dob = Date()
    @State var name = ""
    @State var gender = ""
    @State var mobile = ""
    @State var email = ""
    @State var password = ""
    @State var cPassword = ""
    @State var location = ""
    
    @State var show = false
        
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

                            TextField("Name", text: $name)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(20)
                                .disableAutocorrection(true)
                            
                            TextField("Gender", text: $gender)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(20)
                                .disableAutocorrection(true)
                            
//                                Picker(selection: $gender, label: Text("Gender")) {
//                                    //Text("Gender").tag(1)
//                                    Text("Male").tag(1)
//                                    Text("Female").tag(2)
//                                }
//                                .padding()
//                                .foregroundColor(Color.gray)
//                                .frame(width: 335, alignment: .leading)
//                                .background(Color(.secondarySystemBackground))
//                                .cornerRadius(20)
//                                .disableAutocorrection(true)
                           
                            
                            
                            TextField("NIC Number", text: $nic)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(20)
                            
                            DatePicker(selection: $dob, in: ...Date(), displayedComponents: .date, label: {Text("Date of Birth")})
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
                                .ignoresSafeArea(.keyboard, edges: .bottom)
                            
                            SecureField("Confirm Password", text: $cPassword)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(20)
                                .ignoresSafeArea(.keyboard, edges: .bottom)
                            
                            HStack(spacing: 15){
                                Text(HomeModel.userLocation == nil ? "Locating..." : "Current Location")
                                Text(HomeModel.userAddress)
                                Spacer(minLength: 0)
                            }
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(20)
                        }
                        .padding([.leading, .trailing], 27.5)
                    }
 
                    Button(action: {
                        //register()
                        registerVM.register()
                        
                        userModel.addData(nic: nic, dob: dob as NSDate, name: name,gender: gender, mobile: mobile, email: registerVM.email, password: registerVM.password, location: HomeModel.userAddress)
                        
                        clearFormField()
                        
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
                  LinearGradient(gradient: Gradient(colors: [.white, .cyan]), startPoint: .top, endPoint: .bottom))
                .onAppear(perform: {
                    //Calling location delegate
                    HomeModel.locationManager.delegate = HomeModel
                })
            }
    
    private func clearFormField() {
        nic = ""
        name = ""
        gender = ""
        mobile = ""
        email = ""
        password = ""
        cPassword = ""
        location = ""
    }
    
//    private func register(){
//        Auth.auth().createUser(withEmail: email, password: password) { result, error in
//            if let error = error {
//                print("Failed to create user: ", error.localizedDescription)
//            }else {
//                print("Successfully created user : \(result?.user.uid ?? "")")
//            }
//        }
//    }
}
    


struct SginUpView_Previews: PreviewProvider {
    static var previews: some View {
        SginUpView()
    }
}
