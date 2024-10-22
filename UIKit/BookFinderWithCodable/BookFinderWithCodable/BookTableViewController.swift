//
//  BookTableViewController.swift
//  BookFinderWithCodable
//
//  Created by Lia An on 10/22/24.
//

import UIKit

class BookTableViewController: UITableViewController {
    let apiKey = "KakaoAK ca5471e3798d8d7be8096008a622a0df" // REST API
    var bookInfo: [Book] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        search(query:"한강", page: 1)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookInfo.count
    }

    func search(query:String, page:Int){
        let str = "https://dapi.kakao.com/v3/search/book?query=\(query)&page=\(page)"
        guard let strURL = str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                let url = URL(string: strURL)
        else { return }
        print(strURL)
        var request = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let data = data else { return }
            do {
                let apiResult = try JSONDecoder().decode(BookInfo.self, from: data)
                self.bookInfo = apiResult.books // 데이터 저장
                DispatchQueue.main.async {
                    self.tableView.reloadData() // 메인 스레드에서 UI 업데이트
                }
            } catch {
                print("Decoding error: \(error.localizedDescription)")
            }
        }
        task.resume()
 
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "book", for: indexPath)
        
        let book = bookInfo[indexPath.row]
        
        let imageView = cell.viewWithTag(1) as? UIImageView
        
        let lblTitle = cell.viewWithTag(2) as? UILabel
        lblTitle?.text = book.title
        
        let lblAuthors = cell.viewWithTag(3) as? UILabel
        let authors = book.authors
        lblAuthors?.text = authors.joined(separator: ", ")
        
        // book thumbnail
        let thumbnail = book.thumbnail // thumbnail은 이제 String입니다.
        if let url = URL(string: book.thumbnail) {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.imageView?.image = image
                        cell.setNeedsLayout()
//                        imageView?.image = image
                    }
                }
            }
            task.resume()
        }



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
