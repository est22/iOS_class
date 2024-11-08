//
//  ForecastView.swift
//  OpenAPIWithSwiftUI
//
//  Created by Lia An on 11/8/24.
//

import SwiftUI

struct ForecastView: View {
    @State var city = ""
    @StateObject var provider = ForecastProvider()
    
    var body: some View {
        VStack {
            SearchBar(searchText: $city){
                provider.getForecast(city: city)
            }
        }
    }
}

#Preview {
    ForecastView(city: "seoul")
}
