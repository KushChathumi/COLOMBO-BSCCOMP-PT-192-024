//
//  Home.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-01.
//

import SwiftUI

struct Home: View {
    
    @StateObject var HomeModel = HomeViewModel()
    
    var body: some View {
        
            VStack(spacing: 10){
                HStack (alignment: .center, spacing: 0){
                          Text("NIBM Broker")
                          .fontWeight(.medium)
                          .padding()
                          .frame(width: 425)
                          .font(.system(size: 40))
                          .foregroundColor(.white)
                          .background(.cyan)
                }
                
                HStack(spacing: 15){
                    Text(HomeModel.userLocation == nil ? "Locating..." : "Current Location")
                        .foregroundColor(.black)
                    
                    Text(HomeModel.userAddress)
                        .font(.caption)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                    Spacer(minLength: 0)
                }
                .padding([.horizontal,.top])
                
                Divider()
                
                HStack(spacing:15){
                    TextField("Select ", text: $HomeModel.search)
                    
                    if HomeModel.search != ""{
                        
                        Button(action: {}, label: {
                        
                        Image(systemName: "search")
                            .font(.title2)
                            .foregroundColor(.gray)
                        })
                    }
                
               Spacer()
                }
                .padding([.horizontal])
                .padding(.top,10)
                
                Divider()
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    VStack(spacing: 25){
                        
                        ForEach(HomeModel.items){item in
                            //Text(item.item_type)
                            ItemView(item: item)
                                .frame(width: UIScreen.main.bounds.width - 10)
                        }
                    }
                })
                
            }
            
        .onAppear(perform: {
            //Calling location delegate
            HomeModel.locationManager.delegate = HomeModel
        })
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
 
