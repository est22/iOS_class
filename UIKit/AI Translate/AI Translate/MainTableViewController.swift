//
//  MainTableViewController.swift
//  AI Translate
//
//  Created by Lia An on 11/5/24.
//

import UIKit
import Alamofire

class MainTableViewController: UITableViewController {
    let endpoint = "https://api.cognitive.microsofttranslator.com/translate?api-version=3.0"
    let subscriptionKey = "9lnWNLlgKD2Rw4Ar68mV7QmREGXJwaBHJqQb4hI3BgF2yft5al95JQQJ99AKACYeBjFXJ3w3AAAbACOGygGc"
    let region = "eastus"
    let targetLanguage = "en,ja,fr,zh,es"
    
    var translations: [Translation]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return translations?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let translation = translations?[indexPath.row] else { return cell }
        
        var config = cell.defaultContentConfiguration()
        config.text = "\(translation.to) : \(translation.text)"
        cell.contentConfiguration = config
        
        return cell
    }

    
}


extension MainTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        let strURL = "\(endpoint)&to=\(targetLanguage)"
        let body = [Text(text: text)]
        // headers
        let headers: HTTPHeaders = [
            "Ocp-Apim-Subscription-Key": subscriptionKey,
            "Ocp-Apim-Subscription-Region": region,
            "Content-Type": "application/json"
        ]
        // Alamofire request
        let alamo = AF.request(strURL, method: .post, parameters: body, encoder: JSONParameterEncoder.default, headers: headers)
        
        alamo.responseDecodable(of: [Document].self) { response in
            switch response.result {
            case .success(let documents): // 변수 설정 document's'
                self.translations = documents.first?.translations
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                let detailVC = self.storyboard?.instantiateViewController(identifier: "detail") as? DetailViewController
                detailVC?.result = self.translations?.first?.text
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(detailVC!, animated: true)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
            
        }
    }
}


