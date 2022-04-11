//
//  ItemView.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-01.
//

import SwiftUI
import SDWebImageSwiftUI

struct ItemView: View {
    
    var item: Item
    
    @State var show = false
    
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
}
