//
//  MainView.swift
//  OpenAPIWithSwiftUI
//
//  Created by Lia An on 11/8/24.
//

import SwiftUI

struct MainView: View {
    var weatherProvider = WeatherProvider()
    var body: some View {
        TabView {
            BookList()
                .tabItem {
                    Image(systemName: "books")
                    Text("책검색")
                }
        }.environmentObject(weatherProvider)
            .onAppear {
                weatherProvider.getWeather()
            }
    }
}

#Preview {
    MainView()
}
