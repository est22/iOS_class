//
//  ForecastProvider.swift
//  OpenAPIWithSwiftUI
//
//  Created by Lia An on 11/8/24.
//

import Foundation
import Alamofire

class ForecastProvider: ObservableObject {
    @Published var list: [Forecast]?
    let appid = "0d62c45ebe5fff9fca2ec0bfda3a394b"
    let endPoint = "https://api.openweathermap.org/data/2.5/forecast?"
    
    func getForecast(city: String) {
        let parameters: [String: Any] = ["q":city, "appid":appid, "lang":"kr", "units":"metric"]
        AF.request(endPoint, method: .get, parameters: parameters)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Root.self) { response in
                switch response.result {
                case .success(let forecasts):
                    self.list = forecasts.list
                    print(forecasts.list[0]) // Debug
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            
        }
        
    }
    
    
    
    
}
