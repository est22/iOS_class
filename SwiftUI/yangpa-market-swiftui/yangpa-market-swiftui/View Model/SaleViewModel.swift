//
//  SaleViewModel.swift
//  yangpa-market-swiftui
//
//  Created by Lia An on 11/15/24.
//

import SwiftUI
import Alamofire

class SaleViewModel: ObservableObject {
    @Published var sales:[Document] = []
    @Published var message = ""
    @Published var isShowingSales = false
    @Published var isFetchError = false
    @Published var isAddShowing = false
    @AppStorage("token") var token:String?
    @AppStorage("userName") var userName:String?
    private var isLoading = false
    private var page = 1
    let endPoint = "http://localhost:3000"
    
    func fetchSales(size: Int = 10){
        guard !isLoading else { return }
        isLoading = true
        let url = "\(endPoint)/sales"
        guard let token = self.token  else { return }
        let params: Parameters = ["page":self.page, "size":size]
        let headers: HTTPHeaders = ["Authorization": "Bearer \(token)"]
        
        AF.request(url, method: .get, parameters: params, headers: headers)
            .response { response in
                if let statusCode = response.response?.statusCode {
                    switch statusCode {
                    case 200..<300:
                        if let data = response.data {
                            do {
                                let root = try JSONDecoder().decode(SaleRoot.self, from: data)
                                // 무한스크롤 Load more data
                                self.sales.append(contentsOf: root.documents)
                                print(self.sales) // debug
                                self.page += 1
                                
                                if self.sales.isEmpty {
                                    self.isFetchError = true
                                    self.message = "등록된 상품이 없습니다."
                                }
                            } catch let error {
                                self.isFetchError = true
                                self.message = error.localizedDescription
                            }
                        }
                        
                    case 300..<600:
                        self.isFetchError = true
                        if let data = response.data {
                            do {
                                let apiError = try JSONDecoder().decode(APIError.self, from: data)
                                self.message = apiError.message
                            } catch let error {
                                self.message = error.localizedDescription
                            }
                        }
                        
                    default:
                        self.isFetchError = true
                        self.message = "알 수 없는 에러가 발생했습니다."
                        
                        
                    }
                }
                self.isLoading = false
            }
        
    }
    
    func addSale(image: UIImage?, productName: String?, description:String?, price: String?){
        guard let imageData = image?.jpegData(compressionQuality: 0.2) else { return }
        let formData = MultipartFormData()
        formData.append(imageData, withName: "photo", fileName: "photo.jpg", mimeType: "image/jpeg")
        formData.append(productName!.data(using: .utf8)!, withName: "productName")
        formData.append(productName!.data(using: .utf8)!, withName: "description")
        formData.append(productName!.data(using: .utf8)!, withName: "price")
        //      위에서 @AppStorage("userName") 선언
        let userName = self.userName
        //       만약 self.userName = "wizard" 라고 하면, @AppStorage("userName") var userName:String? 에다가 값을 적어주는 것
        formData.append(userName!.data(using: .utf8)!, withName: "userName")
        
        guard let token = self.token else { return }
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Content-Type" : "multipart/form-data"
        ]
        let url = "\(endPoint)/sales"
        AF.upload(multipartFormData: formData, to: url, headers: headers).response { response in
            if let statusCode = response.response?.statusCode {
                switch statusCode {
                case 200..<300: // normal case
                    if let data = response.data {
                        do {
                            let root = try
                            JSONDecoder().decode(SaleRoot.self, from: data)
                            self.isAddShowing = true
                            self.message = root.message
                        } catch let error {
                            self.isAddShowing = true
                            self.message = error.localizedDescription
                        }
                    }
                case 300..<600: // error case
                    if let data = response.data {
                        do {
                            let apiError = try
                            JSONDecoder().decode(APIError.self, from: data)
                            self.isAddShowing = true
                            self.message = apiError.message
                        } catch let error {
                            self.isAddShowing = true
                            self.message = error.localizedDescription
                        }
                    }
                default:
                    self.isAddShowing = true
                    self.message = "알 수 없는 에러가 발생했습니다."
                    
                }
            }
            
        }
    }
}
