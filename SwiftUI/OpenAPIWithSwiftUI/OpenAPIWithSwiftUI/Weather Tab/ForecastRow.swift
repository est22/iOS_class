//
//  ForecastRow.swift
//  OpenAPIWithSwiftUI
//
//  Created by Lia An on 11/8/24.
//

import SwiftUI

struct ForecastRow: View {
    var forecast: Forecast
    var body: some View {
        Text(forecast.date)
    }
}

#Preview {
    WeatherRow()
}
