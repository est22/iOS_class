//
//  ForecastProvider.swift
//  OpenAPIWithSwiftUI
//
//  Created by Lia An on 11/8/24.
//

import Foundation
import Alamofire

class ForecastProvider: ObservableObject {
    @Published var list:[Forecast] = []
    let appid = "0d62c45ebe5fff9fca2ec0bfda3a394b"
    let endpoint = "https://api.openweathermap.org/data/2.5/forecast"
    
    func getForecase(city: String){
        let params:Parameters = ["q":city, "appid":appid, "lang":"kr", "units":"metric"]
        AF.request(endpoint, method: .get, parameters: params).responseDecodable(of:Root.self) {response in
            switch response.result {
                case .success(let root):
                    self.list = root.list
                    print(self.list[0]) // Debug
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
    }
}
