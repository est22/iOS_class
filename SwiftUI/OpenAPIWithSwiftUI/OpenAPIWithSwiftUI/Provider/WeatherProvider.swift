//
//  WeatherProvider.swift
//  OpenAPIWithSwiftUI
//
//  Created by Lia An on 11/8/24.
//

import Foundation
import Alamofire

class WeatherProvider: ObservableObject {
    @Published var main: String = ""
    @Published var description: String = ""
    @Published var icon: String = ""
    @Published var temp: Double?
    
    let appid = "0d62c45ebe5fff9fca2ec0bfda3a394b"
    let endPoint = "https://api.openweathermap.org/data/2.5/weather"

    
    func getWeather() {
        let params:Parameters = ["appid": appid, "q": "seoul", "units":"metric", "lang":"kr"]
        AF.request(endPoint, method: .get, parameters: params)
            .validate(statusCode: 200..<300)
            .responseDecodable(of:Result.self) { response in
                switch response.result {
                case .success(let result):
                    let weather = result.weather[0]
                    self.main = weather.main
                    print(self.main) // Debug
                    self.temp = result.main.temp
                    self.icon = "https://openweathermap.org/img/wn/\(weather.icon)@2x.png"
                    self.description = weather.description
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }}
    }
}
