//
//  MemberViewModel.swift
//  yangpa-market-swiftui
//
//  Created by Lia An on 11/15/24.
//


// ObservableObject
import SwiftUI
import Alamofire
import SVProgressHUD

class MemberViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var isLoginError = false
    @Published var message = ""
    let endPoint = "http://localhost:3000"
    
    func login(userName: String, password: String) {
        SVProgressHUD.show()
        
        let url = "\(endPoint)/members/sign-in"
        let params:Parameters = ["userName":userName, "password":password]
        // request
        AF.request(url, method: .post, parameters: params)
            .response { response in // response handling
            if let statusCode = response.response?.statusCode {
                // error handling per statusCode
                    switch statusCode {
                    // case 1
                    case 200..<300:
                        if let data = response.data {
                            // data decode error handling
                            do {
                                let signIn = try JSONDecoder().decode(SignIn.self, from: data)
                                // change user status to logged in
                                self.isLoggedIn = true
                                // set user token
                                UserDefaults.standard.set(signIn.token, forKey: "token")
                                UserDefaults.standard.set(signIn.member.userName, forKey: "userName")
                                UserDefaults.standard.set(self.isLoggedIn, forKey: "isLoggedIn")

                            } catch let error {
                                self.isLoginError = true
                                self.message =  error.localizedDescription
                            }
                            
                        }
                    // case 2
                    case 300..<600:
                        self.isLoginError = true
                        
                        if let data = response.data {
                            do {
                                let apiError = try JSONDecoder().decode(APIError.self, from: data)
                                self.message = apiError.message
                            } catch let error {
                                self.message = error.localizedDescription
                            }
                        }
                    // case default
                    default:
                        self.isLoginError = true
                        self.message = "알 수 없는 에러가 발생했습니다."
                    
                }
                }
                
        }
        SVProgressHUD.dismiss()
    }
}
