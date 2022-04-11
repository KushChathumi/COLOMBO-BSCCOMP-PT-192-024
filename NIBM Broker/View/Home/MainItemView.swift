//
//  MainItemView.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-11.
//

import SwiftUI

struct MainItemView: View {
    
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
            Spacer(minLength: 0)
        }
        .fullScreenCover(isPresented: self.$show){
            CreateItemView()
        }
    }
}

