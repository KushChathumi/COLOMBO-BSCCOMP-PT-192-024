//
//  MainView.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-08.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeAutorizedView()
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
            CreateItemView()
                .tabItem{
                    Label("Ads", systemImage: "plus.square.on.square.fill")
                }
            SettingsView()
                .tabItem{
                    Label("Setting", systemImage: "person.crop.circle.badge.plus.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
