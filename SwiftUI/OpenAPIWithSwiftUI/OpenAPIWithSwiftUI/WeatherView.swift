//
//  WeatherView.swift
//  OpenAPIWithSwiftUI
//
//  Created by Lia An on 11/8/24.
//

import SwiftUI

struct WeatherView: View {
    @EnvironmentObject var provider: WeatherProvider
    var body: some View {
        HStack {
            Text(provider.description)
            AsyncImage(url: URL(string: provider.icon)) {
                image in
                image.image?.resizable().frame(width: 30, height: 30)
            }
            if let temp = provider.temp{
                Text(String(format: "%.1f°C", temp))
                    .bold()
                    .foregroundStyle(temp > 10 ? .red : .blue)
                    .padding(.leading, -12)
            }
        }
    }
}

#Preview {
    let provider = WeatherProvider()
    WeatherView().environmentObject(provider).onAppear {
        provider.getWeather()
    }
}
