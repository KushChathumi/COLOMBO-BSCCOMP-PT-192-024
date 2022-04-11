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
    @State var show = false
    
    var body: some View {
        
        VStack{
            WebImage(url: URL(string: item.item_image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)

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
        }
    }
}
