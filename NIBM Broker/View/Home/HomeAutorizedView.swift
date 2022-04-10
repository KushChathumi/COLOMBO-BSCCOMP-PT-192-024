//
//  HomeAutorizedView.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-08.
//

import SwiftUI

struct HomeAutorizedView: View {
    
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

            Spacer(minLength: 0)

            Divider()
            }
    }
}

struct HomeAutorizedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeAutorizedView()
    }
}
