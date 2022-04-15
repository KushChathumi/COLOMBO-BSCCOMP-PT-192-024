//
//  ItemView.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-01.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase
import FirebaseStorage

struct ItemView: View {
    
    var item: Item
    
    @State var show = false
    @State var retriveImage = [UIImage]()
    @State var retrievedImages = [UIImage]()
    
    var body: some View {
        VStack{
            ZStack{
                 
                VStack(alignment: .leading){
                    //Downloading Image from Web..
                    
                    WebImage(url: URL(string: item.item_image))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                }
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
                
                Button(action: {
                    self.show.toggle()
                    
                }){
                    Text("Click Here to View ...!")
                        .frame(width: 250, height: 50)
                        .background(Color(.secondarySystemBackground))
                        .foregroundColor(.red)
                            
                    }
            }
            .fullScreenCover(isPresented: self.$show){
                Signin()
            }
            
            VStack{
                ForEach(retrievedImages, id:\.self){ image in
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 200, height: 200)
                }
            }
            .onAppear{
                self.retrieveData()
            }
            
            HStack(alignment: .firstTextBaseline, spacing: 5){
                Text(item.item_district)
                    //.font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(" - ")
                    //.font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(item.item_type)
                   // .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
        }
    }
    
    func retrieveData(){
        //Get data from DB
        let db = Firestore.firestore()
        // GEt the data in storage
        db.collection("Items").getDocuments { (snap, err) in
            if err == nil && snap != nil {
                var paths = [String]()
                
                for doc in snap!.documents {
                    //Extract the file path
                    paths.append(doc["item_image"] as! String)
                }
                //Loop through each file path and fetch the data from storage
                for path in paths{
                    // get a reference to storage
                    let storageRef = Storage.storage().reference()
                    
                    // specify the path
                    let fileRef = storageRef.child(path)
                    
                    // retrieve data
                    fileRef.getData(maxSize: 5*1024*1024) { data, err in
                        if err == nil && data != nil {
                            // Create UIImage and piut into array
                            
                            if let image = UIImage(data: data!){
                                DispatchQueue.main.async {
                                    retrievedImages.append(image)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
