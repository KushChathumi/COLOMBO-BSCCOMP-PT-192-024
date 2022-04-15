//
//  MainItemView.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-11.
//

import SwiftUI

struct MainItemView: View {
    
    @ObservedObject var model = Item_ViewModel()
    @StateObject var HomeModel = HomeViewModel()
    
    @State var show = false
    
    var body: some View { 
        VStack{
            HStack(spacing: 15){
                Text("Advertisement")
                    .font(Font.custom("Noteworthy", size: 35))
                    .bold()
                    .foregroundColor(Color.white)

                Spacer(minLength: 0)

                Button(action:{
                    withAnimation{
                        self.show.toggle()
                    }
                } ){
                    Text("Add")
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal,25)
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.cyan)
            .fullScreenCover(isPresented: self.$show){
                CreateItemView()
            }
            Spacer(minLength: 0)
            
            List (model.list){ item in
                HStack{
                    VStack{
                        Text(item.item_type + " - " + item.item_district)
                    }

                    Spacer(minLength: 0 )

                    Divider()

                    Button( action:{
                        model.deleteData(advertismentToDelete: item)
                    }){
                        Image(systemName: "trash")
                    }
                }

            }
        }   
    }
    init(){
        model.getData()
    }
}

