//
//  CreateItemView.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-08.
//

import SwiftUI

struct CreateItemView: View {
    
    @State var show = false
    @State var isPickerShowing = false
    @State var selecetdImage: UIImage?
    @State var price = ""
    @State var type = ""
    @State var size = ""
    @State var district = ""
    @State var location = ""
    
    var body: some View {
        VStack{
            HStack(spacing: 15){
                Text("Advertisement")
                    .font(Font.custom("Noteworthy", size: 35))
                    .bold()
                    .foregroundColor(Color.white)
                
                Spacer(minLength: 0)
                
                Button(action:{
                    self.show.toggle()
                } ){
                    Text("Back")
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal,25)
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.cyan)
            
            VStack(spacing: 20){
                
                Text("Create your advertiestment")
                    .font(Font.custom("Noteworthy", size: 25))
                    .bold()
                    .foregroundColor(Color.black)

                ScrollView{
                    VStack(spacing: 20 ){
                        VStack(alignment: .leading, spacing: 0 ){

                                if selecetdImage != nil{
                                    Image(uiImage: selecetdImage!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 330, height: 175, alignment: .center)
                                        //.background(Color(.secondarySystemBackground))
                                        .background(Color.white)
                                }
                                
                            Button(action: {
                                self.isPickerShowing.toggle()
                            }, label: {
                                Text("Tap Here to add Images")
                                    .frame(width: 330, height: 40)
                                    //.background(Color(.secondarySystemBackground))
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .foregroundColor(Color.gray)
                            })
                        }
                        .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
                            //image picker
                            ItemViewModel(selectedImage: $selecetdImage, isPickerShowing: $isPickerShowing)
                        }

                        TextField("Price (Per perch)", text: $price)
                            .frame(width: 325, height: 40)
                            .padding(.leading,10)
                            //.background(Color(.secondarySystemBackground))
                            .background(Color.white)
                             .cornerRadius(5)
                        
                        TextField("Land/House", text: $type)
                            .frame(width: 325, height: 40)
                            .padding(.leading,10)
                            //.background(Color(.secondarySystemBackground))
                            .background(Color.white)
                            .cornerRadius(5)
                        
                        TextField("Land size (No of Perch)", text: $size)
                            .frame(width: 325, height: 40)
                            .padding(.leading,10)
                            //.background(Color(.secondarySystemBackground))
                            .background(Color.white)
                            .cornerRadius(5)
                        
                        TextField("District", text: $district)
                            .frame(width: 325, height: 40)
                            .padding(.leading,10)
                            //.background(Color(.secondarySystemBackground))
                            .background(Color.white)
                            .cornerRadius(5)
                        
                        TextField("location", text: $location)
                            .frame(width: 325, height: 40)
                            .padding(.leading,10)
                            //.background(Color(.secondarySystemBackground))
                            .background(Color.white)
                            .cornerRadius(5)
                        
                        HStack(spacing: 50){
                            Button(action: {
                                clearFormField()
                            }, label: {
                                Text("Clear")
                                    .font(Font.custom("Vardana", size: 20))
                                    .foregroundColor(Color.white)
                                    .frame(width: 100, height: 40)
                                    .background(Color.red)
                                    .cornerRadius(20)
                            })
                            
                            Button(action: {
                                
                            }, label: {
                                Text("Add")
                                    .font(Font.custom("Vardana", size: 20))
                                    .foregroundColor(Color.white)
                                    .frame(width: 100, height: 40)
                                    .background(Color.green)
                                    .cornerRadius(20)
                                
                            })
                        }
                    }
                }
            }
            .padding()
        }
        .fullScreenCover(isPresented: self.$show){
                MainView()
        }
        .background(Color("Color"))
    }
    
    private func clearFormField() {

        price = ""
        type = ""
        size = ""
        district = ""
        location = ""
        }
}

struct CreateItemView_Previews: PreviewProvider {
    static var previews: some View {
        CreateItemView()
    }
}
