//
//  CreateItemView.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-08.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct CreateItemView: View {
    
    @ObservedObject var model = Item_ViewModel()
    
    @State var show = false
    @State var isPickerShowing = false
    @State var selecetdImage: UIImage?
    @State var item_type = ""
    @State var item_cost = ""
    @State var item_size = ""
    @State var item_district = ""
    @State var item_town = ""
    @State var item_image = ""
    @State var item_contact = ""
    
    
    
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

                        TextField("Price (Per perch)", text: $item_cost)
                            .frame(width: 325, height: 40)
                            .padding(.leading,10)
                            //.background(Color(.secondarySystemBackground))
                            .background(Color.white)
                             .cornerRadius(5)
                        
                        TextField("Land/House", text: $item_type)
                            .frame(width: 325, height: 40)
                            .padding(.leading,10)
                            //.background(Color(.secondarySystemBackground))
                            .background(Color.white)
                            .cornerRadius(5)
                        
                        TextField("Land size (No of Perch)", text: $item_size)
                            .frame(width: 325, height: 40)
                            .padding(.leading,10)
                            //.background(Color(.secondarySystemBackground))
                            .background(Color.white)
                            .cornerRadius(5)
                        
                        TextField("District", text: $item_district)
                            .frame(width: 325, height: 40)
                            .padding(.leading,10)
                            //.background(Color(.secondarySystemBackground))
                            .background(Color.white)
                            .cornerRadius(5)
                        
                        TextField("location", text: $item_town)
                            .frame(width: 325, height: 40)
                            .padding(.leading,10)
                            //.background(Color(.secondarySystemBackground))
                            .background(Color.white)
                            .cornerRadius(5)
                        
                        TextField("Contact Number", text: $item_contact)
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
                               // uploadImage()
                                model.addData(item_type: item_type, item_cost: item_cost, item_size: item_size, item_district: item_district, item_town: item_town, item_image: item_image, item_contact: item_contact)
                                clearFormField()
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

        item_type = ""
        item_cost = ""
        item_size = ""
        item_district = ""
        item_town = ""
        }
    
//    func uploadImage(){
//        guard selecetdImage != nil else {
//            return
//        }
//        //Creaet storage reference
//        let storageRef = Storage.storage().reference()
//        // turn image into data
//        let imageData = selecetdImage!.jpegData(compressionQuality: 0.8)
//
//        guard imageData != nil else {
//            return
//        }
//        //specify the file path and name
//
//        //let path = "items/\(UUID().uuidString).jpg"
//        let path = "\(UUID().uuidString).webp"
//        let fileRef = storageRef.child(path)
//
//        // Upload thata data
//
//        let UploadTask = fileRef.putData(imageData!, metadata: nil) { metadata, error in
//            if error == nil && metadata != nil{
//                let db = Firestore.firestore()
//                db.collection("Items").document().setData(["item_image":path])
//
//            }
//        }
//        // save a reference to the file in firebase db
//    }
}


struct CreateItemView_Previews: PreviewProvider {
    static var previews: some View {
        CreateItemView()
    }
}
