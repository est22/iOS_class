//
//  BookTableViewController.swift
//  BookFinder
//
//  Created by Lia An on 9/6/24.
//

import UIKit

class BookTableViewController: UITableViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var btnPrev: UIBarButtonItem!
    @IBOutlet weak var btnNext: UIBarButtonItem!
    
    let apiKey = "KakaoAK ca5471e3798d8d7be8096008a622a0df"
    
    var page = 1 {
        didSet { // ???: -이렇게 써도 되나
            btnPrev.isEnabled = page > 1
            searchWithQuery(searchBar.text, page: page)
        }
    }
    
    var documents: [[String:Any]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120
        searchWithQuery("해리포터", page: 1)
        btnNext.isEnabled = false
        btnPrev.isEnabled = false
        
    }
    
    func searchWithQuery(_ query: String?, page: Int){
        // query 변수 optional 처리
        guard let query else { return }
        
        let endPoint = "https://dapi.kakao.com/v3/search/book?&query=\(query)&page=\(page)"
        
        guard let strURL = endPoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: endPoint) else { return }
        var request = URLRequest(url: url)
        
        // header 교체
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "Authorization")
        
        // 세션 연결  - Singleton Pattern
        let session = URLSession.shared
        // task 생성
        let task = session.dataTask(with: request) { data, response, error in
            if let error {
                print(error.localizedDescription)
                return
            }
            guard let data else { return } // 데이터 언랩핑 -> guard-let으로 해라.(코드블럭 안으로 안들어가도 됨)
            // Data 직렬화
            do {
                guard let root = try JSONSerialization.jsonObject(with: data) as? [String:Any]
                else { return }
                // !!!: - Data 형식 바뀌는 시점 -> tableView에게 알려줘야함
                // let documents로 쓰면 나중에 tableView에서 못씀.
                // 클로저 안에서 프로퍼티를 쓸 때, 항상 self를 적어주어야한다.
                self.documents = root["documents"] as? [[String:Any]]
                
                // get "is_end" data from "meta" data
                if let meta = root["meta"] as? [String:Any], let isEnd = meta["is_end"] as? Bool {
                    DispatchQueue.main.async {
                        // !!!: - isEnabled와 isEnd값을 반대로 해줌
                        self.btnNext.isEnabled = !isEnd
                    }
                }
                
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                print("JSON Parsing Error Occured")
            }
        }// .resume() 이라고 끝에 붙임.
        // task 실행
        task.resume()
        
        
        
    } // func search()
    
    
    @IBAction func actPrev(_ sender: Any) {
        page -= 1
        
    }
    
    
    @IBAction func actNext(_ sender: Any) {
        page += 1
        
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "book", for: indexPath)
        
        guard let book = documents?[indexPath.row] else { return cell }
        let imageView = cell.viewWithTag(1) as? UIImageView
        
        let lblTitle = cell.viewWithTag(2) as? UILabel
        lblTitle?.text = book["title"] as? String
        
        let lblAuthors = cell.viewWithTag(3) as? UILabel
        let authors = book["authors"] as? [String]
        lblAuthors?.text = authors?.joined(separator: ", ")
        
        let lblPublisher = cell.viewWithTag(4) as? UILabel
        lblPublisher?.text = book["publisher"] as? String
        
        let lblPrice = cell.viewWithTag(5) as? UILabel
        lblPrice?.text = "\((book["price"] as? Int) ?? 0)원"
        
        // book thumbnail
        if let thumbnail = book["thumbnail"] as? String { // guard-let 쓰면 return cell을 못하니까 전체가 다 안나옴.
            if let url = URL(string: thumbnail) {
                let request = URLRequest(url: url)
                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    if let data {
                        DispatchQueue.main.async {
                            imageView?.image = UIImage(data: data)
                        }
                    }
                } // handler
                task.resume()
            }
        }
        
        return cell
    }
    
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // detailVC: UIVC 타입이므로 형변환
        let detailVC = segue.destination as? BookDetailViewController
        // 아무 컨텐츠도 없으므로 tableView에게 indexPath 물어봐서 가져옴
        guard let indexPath = tableView.indexPathForSelectedRow,
              let book = documents?[indexPath.row]
        else { return }
        detailVC?.strURL = book["url"] as? String
        
    }
    
    
}

extension BookTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        page = 1
        // 키보드가 알아서 내려가게끔
        searchBar.resignFirstResponder()
    }
}
