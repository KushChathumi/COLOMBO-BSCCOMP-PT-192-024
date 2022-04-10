//
//  HomeItem.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-10.
//

import SwiftUI
import SDWebImageSwiftUI


struct HomeItem: View{
    
    var item: Item
    
    var body: some View {
        
        VStack{
            //Downloading Image from Web..
            
            WebImage(url: URL(string: item.item_image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
            
            HStack{
                Text(item.item_type)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
                
            }
            
            HStack{
                Text("Distric : ")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(item.item_district)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            
            HStack{
                Text("Town/Village : ")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(item.item_town)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            
//            HStack{
//                Text("Price : ")
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//
//                Text(item.item_cost)
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//            }
//
//            HStack{
//                Text("Land Size : ")
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//
//                Text(item.item_size)
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//            }
//
//            HStack{
//                Text("Contact : ")
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//
//                Text(item.contact)
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//            }
        }
        
    }
}
