//
//  LoginViewController.swift
//  YangpaMarket
//
//  Created by Lia An on 11/6/24.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actSignUp(_ sender: Any) {
        let parameters: Parameters = ["userName":txtId.text!, "password":txtPassword.text!]
        let endPoint = "\(host)/members/sign-up"
        let alamo = AF.request(endPoint, method: .post, parameters: parameters)
        alamo.responseDecodable(of: SignUp.self){ response in
            switch response.result {
            case .success(let signUp):
                let alert = UIAlertController(title: "회원가입", message: signUp.message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .default) { _ in
                    self.txtId.text = ""
                    self.txtPassword.text = ""
                }
                alert.addAction(action)
                self.present(alert, animated: true)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    @IBAction func actLogin(_ sender: Any) {
        let parameters: Parameters = ["userName":txtId.text!, "password":txtPassword.text!]
        let endPoint = "\(host)/members/sign-in"
        let alamo = AF.request(endPoint, method: .post, parameters: parameters)
        alamo.responseDecodable(of:Login.self) { response in
            switch response.result {
            case .success(let login):
                if login.success {
                    UserDefaults.standard.set(login.token, forKey: "token")
                    UserDefaults.standard.set(login.member.userName, forKey: "userName")
                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
                    self.dismiss(animated: true)
                } else {
                    let alert = UIAlertController(title: "로그인 에러", message: login.message, preferredStyle: .alert)
                    let action = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(action)
                    self.present(alert, animated: true)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
