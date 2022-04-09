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
            ZStack{
                Rectangle()
                        .fill(.cyan)
                        .frame(height:350)
                VStack{
                    Text("Profile")
                        .frame(width: 350, alignment: .topLeading)
                        .foregroundColor(Color.white)
                        .font(Font.custom("Noteworthy", size: 40))
                    
                    HStack( spacing: 0){
                        Circle()
                            .fill(.white)
                            .frame(height:150, alignment:.trailing)
                        VStack(alignment: .leading, spacing: 5){
                            Text("Name")
                                .foregroundColor(Color(.secondarySystemBackground))
                                .font(Font.custom("vardana", size: 30))
                                .disableAutocorrection(true)
                            
                            Text("Email address")
                                .foregroundColor(Color(.secondarySystemBackground))
                                .font(Font.custom("vardana", size: 25))
                                .disableAutocorrection(true)
                            
                            Text("NIC Number")
                                .foregroundColor(Color(.secondarySystemBackground))
                                .font(Font.custom("vardana", size: 25))
                        }
                    }
                }
                
            }
        }
    }
}

struct HomeAutorizedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeAutorizedView()
    }
}
