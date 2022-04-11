//
//  HomeAutorizedView.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-08.
//

import SwiftUI

struct HomeAutorizedView: View {
    
    @StateObject var HomeModel = HomeViewModel()
    
    var body: some View {
        
        VStack{
            HStack(spacing: 15){
                Text("Home")
                    .font(Font.custom("Noteworthy", size: 35))
                    .bold()
                    .foregroundColor(Color.white)

                Spacer(minLength: 0)

                Button(action:{

                } ){
                    Text("Log Out")
                        .foregroundColor(.cyan)
                        .padding(.vertical,10)
                        .padding(.horizontal,25)
                        .background(Color.cyan)
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.cyan)
                                
            VStack{
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    VStack(spacing: 25){
                        
                        ForEach(HomeModel.items){item in
                            //Text(item.item_type)
                            HomeItem(item: item)
                                .frame(width: UIScreen.main.bounds.width - 10)
                        }
                    }
                })
            }
            .padding()
            Spacer(minLength: 0)
            .onAppear(perform: {
                //Calling location delegate
                HomeModel.locationManager.delegate = HomeModel
            })
        }
    }
}
