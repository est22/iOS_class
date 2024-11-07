//
//  MainTableViewController.swift
//  YangpaMarket
//
//  Created by Lia An on 11/6/24.
//

import UIKit
import Alamofire
import Kingfisher

class MainTableViewController: UITableViewController {
    var products: [Product]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if !UserDefaults.standard.bool(forKey: "isLoggedIn") {
            if let loginVC = storyboard?.instantiateViewController(withIdentifier: "login") as? LoginViewController {
                loginVC.modalPresentationStyle = .fullScreen
                present(loginVC, animated: true)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let endPoint = "\(host)/sales"
        guard let token = UserDefaults.standard.string(forKey: "token") else { return }
        let headers: HTTPHeaders = ["Authorization": "Bearer \(token)"]
        let alamo = AF.request(endPoint, method: .get, headers: headers)
        alamo.responseDecodable(of: ProductList.self) { response in
            switch response.result {
                case .success(let result):
                self.products = result.documents
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let product = products?[indexPath.row] else { return cell }
        
        let imageView = cell.viewWithTag(1) as? UIImageView
        let lblName = cell.viewWithTag(2) as? UILabel
        let lblDescription = cell.viewWithTag(3) as? UILabel
        let lblUserName = cell.viewWithTag(4) as? UILabel
        let lblPrice = cell.viewWithTag(5) as? UILabel
        let imageURL = "\(storage)/\(product.photo)"
        if let url = URL(string: imageURL) {
            imageView?.kf.setImage(with: url)
        }
        lblName?.text = product.productName
        lblDescription?.text = product.description
        lblUserName?.text = product.userName
        lblPrice?.text = "\(product.price)"
    
        return cell
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
