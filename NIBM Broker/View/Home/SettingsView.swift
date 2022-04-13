//
//  SettingsView.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-03.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var index = 0
    @State var show = false
    @State var rp = false
     
    var body: some View {
        VStack{
            HStack(spacing: 15){
                Text("Profile")
                    .font(Font.custom("Noteworthy", size: 35))
                    .bold()
                    .foregroundColor(Color.white)
                
                Spacer(minLength: 0)
                
                Button(action:{
                    self.show.toggle()
                } ){
                    Text("Log Out")
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal,25)
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.cyan)
            .fullScreenCover(isPresented: self.$show){
                Signin()
            }

            HStack{
                VStack(spacing: 0){
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 100, height: 3)
                        .zIndex(1)
                       
                    Image("Profile")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.top, 6)
                        .padding(.bottom, 4)
                        .padding(.horizontal,8)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                        .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)

                }
                
                VStack(alignment: .leading, spacing: 12){
                    Text("Kushani Abeysinghe")
                        .font(.title3)
                        .foregroundColor(Color.black.opacity(0.8))
                    
                    Text("kushania@gmail.com")
                        .foregroundColor(Color.black.opacity(0.7))
                    
                    Text("967512346V")
                        .foregroundColor(Color.black.opacity(0.6))
                }
                .padding(.leading,10)
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            HStack{
                Button(action: {
                    self.index = 0
                }){
                    Text("Information")
                        .foregroundColor(self.index == 0 ? Color.white : .gray)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 0 ? Color.green : Color.clear)
                        .cornerRadius(10)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    self.index = 1
                    self.rp.toggle()
                }){
                    Text("Change Password")
                        .foregroundColor(self.index == 1 ? Color.white : .gray)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 1 ? Color.green : Color.clear)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal,8)
            .padding(.vertical,5)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
            .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
            .padding(.horizontal)
            .padding(.top,25)

            .sheet(isPresented: self.$rp){
                ForgotPaswordView()
                
            }
            
            Spacer(minLength: 0)
            
            VStack(alignment: .leading, spacing: 15){
             
                HStack{
                    Image("Gender")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    VStack(alignment: .leading, spacing: 2){
                        Label("Gender", systemImage: "")
                            .foregroundColor(.gray)
                        Label("Gender", systemImage: "")
                    }
                }
                
                HStack{
                    Image("Calender")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    VStack(alignment: .leading, spacing: 2){
                        Label("Date of Birth", systemImage: "")
                            .foregroundColor(.gray)
                        Label("1996-09-07", systemImage: "")
                    }
                }
                
                HStack{
                    Image("Phone")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    VStack(alignment: .leading, spacing: 2){
                        Label("Phone Number", systemImage: "")
                            .foregroundColor(.gray)
                        Label("Gender", systemImage: "")
                    }
                }
                
                HStack{
                    Image("Location")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    VStack(alignment: .leading, spacing: 2){
                        Label("Current location", systemImage: "")
                            .foregroundColor(.gray)
                        Label("Gamenulla", systemImage: "")
                    }
                }
            }
            .padding()
            
            Spacer(minLength: 0)
                
                Button(action: {
                                    
                                }, label: {
                                    Label("Edit", systemImage: "square.and.pencil")
                                        .foregroundColor(.blue)
                                        .frame(width: 200, height: 40)
                                        .cornerRadius(15)
                                })
            
            
            Spacer(minLength: 0)
            
            Divider()
        }
    }
}

    

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

