//
//  ForecastRow.swift
//  OpenAPIWithSwiftUI
//
//  Created by Lia An on 11/8/24.
//

import SwiftUI

let sampleForecastData = Forecast(id: 1731056400, main: Main(temp: 16.6, humidity: 27), weather: [Weather(main: "Clear", description: "맑음", icon: "01n")], date: "2024-11-08 09:00:00")

struct ForecastRow: View {
    let forecast: Forecast
    
    var body: some View {
        HStack {
            let icon = "https://openweathermap.org/img/wn/\(forecast.weather[0].icon)@4x.png"
            // 왼쪽 부분 (아이콘 + 날씨 설명)
            AsyncImage(url: URL(string: icon)) { image in
                image.resizable().frame(width: 50, height: 50)
            } placeholder: {
                Image(systemName: "sun.min")
            }
            

            VStack(alignment: .leading) {
                Text(forecast.date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(forecast.weather[0].description)
                    .font(.headline)
            }
            
            Spacer()
            
            // 오른쪽 부분 (온도 + 습도)
            VStack(alignment: .trailing) {
                HStack {
                    Image(systemName: "thermometer.medium")
                    Text(String(format: "%.1f", forecast.main.temp) + "°C")
                }
                .foregroundStyle(.red)
                
                HStack {
                    Image(systemName: "humidity")
                    Text("\(forecast.main.humidity)%")
                }
                .foregroundStyle(.blue)
            }
        }
        .padding() // 전체 여백 추가
    }
}

#Preview {
    ForecastRow(forecast: sampleForecastData)
}
