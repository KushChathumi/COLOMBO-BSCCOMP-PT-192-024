//
//  ViewContent.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-17.
//

import SwiftUI

struct ViewContent: View {
    var body: some View {
        let viewModel = SignUpViewModel()
        
        if (viewModel.isLogingMode) == true{
            MainView()
                .environmentObject(viewModel)
        } else {
            Home()
                .environmentObject(viewModel)
        }
    }
}

struct ViewContent_Previews: PreviewProvider {
    static var previews: some View {
        ViewContent()
    }
}
