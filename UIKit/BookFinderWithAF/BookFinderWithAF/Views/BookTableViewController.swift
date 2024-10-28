//
//  BookTableViewController.swift
//  BookFinderWithAF
//
//  Created by Lia An on 10/28/24.
//

import UIKit
import Alamofire
import Kingfisher

class BookTableViewController: UITableViewController {

    @IBOutlet weak var btnNext: UIBarButtonItem!
    @IBOutlet weak var btnPrev: UIBarButtonItem!
    @IBOutlet var searchBar: UISearchBar!
    
    let apiKey = "KakaoAK ca5471e3798d8d7be8096008a622a0df"
    var books:[Book]?
    var page = 0 {
        
        didSet {
            btnPrev.isEnabled = page > 1
            search(searchBar.text, page: page)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        search("한강", page: 1)

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func search(_ query:String?, page:Int){
        guard let query else { return }
        let endPoint = "https://dapi.kakao.com/v3/search/book"
        let params: Parameters = ["query":query,"page":page] // body의 url query 부분에 들어가는 부분을 다 넣어준다. Parameters 타입을 적어주어야한다.
        let headers: HTTPHeaders = ["Authorization" : apiKey]
        let alamo = AF.request(endPoint, method: .get, parameters: params, headers: headers)
        alamo.responseDecodable(of: Root.self) { response in
            switch response.result {
            case .success(let root):
                self.books = root.books
                self.btnNext.isEnabled = !root.meta.isEnd
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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "book", for: indexPath)
        guard let book = books?[indexPath.row] else { return cell }
        
        let bookThumbnail = cell.viewWithTag(1) as? UIImageView
        let lblTitle = cell.viewWithTag(2) as? UILabel
        let lblAuthor = cell.viewWithTag(3) as? UILabel
        let lblPrice = cell.viewWithTag(4) as? UILabel
        
        lblTitle?.text = book.title
        lblAuthor?.text = book.authors.joined(separator: ", ")
        lblPrice?.text = "\(book.price)원"
        
        let thumbnailURL = URL(string: book.thumbnail)
        // while loading bookThumbnail img
        bookThumbnail?.kf.setImage(with: thumbnailURL, placeholder: UIImage(systemName: "book.closed"))
        return cell
        

    }
    
    @IBAction func actNext(_ sender: UIBarButtonItem) {
        page += sender.tag
    }
    
    


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let target = segue.destination as? WebViewController
        guard let indexPath = tableView.indexPathForSelectedRow,
              let book = books?[indexPath.row] else { return }
        
        target?.strURL = book.url
        
    }


}

extension BookTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        page = 1
        searchBar.resignFirstResponder()
        
    }
    
}
