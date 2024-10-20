//
//  ViewController.swift
//  TableViewSample-Reuse Cell2
//
//  Created by Lia An on 9/3/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let btsImage = ["bts1", "bts2", "bts3", "bts4","bts5","bts6",
                    "bts7"]
    let bts = ["RM","진","슈가","제이홉","지민","뷔","정국"]
    
    @IBOutlet weak var lblMember: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "bts") // 이걸 재활용할것
        if cell == nil {
            cell = UITableViewCell(style: .value2, reuseIdentifier: "bts")//재활용 표시
        }
        
        var config = cell!.defaultContentConfiguration()
        
        config.image = UIImage(named: btsImage[indexPath.row])
        config.imageProperties.maximumSize.height = 80
        config.text = "\(bts[indexPath.row])"
        config.textProperties.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        config.textProperties.color = .blue
        config.secondaryText = "\(indexPath.row+1)번째 멤버"
        config.secondaryTextProperties.color = .brown

        cell?.contentConfiguration = config
        
        return cell!
    }
    
    /**
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bts", for: indexPath)
        
        // cell 정의
        var content = cell.defaultContentConfiguration()
        // 멤버 이름
        content.text = "\(bts[indexPath.row])"
        content.textProperties.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        content.textProperties.color = .blue
        // 멤버 설명
        content.secondaryText = "\(indexPath.row+1)번째 멤버"
        content.secondaryTextProperties.color = .brown
        // 썸네일 이미지 - 멤버 사진
        content.image = UIImage(named: btsImage[indexPath.row])
        content.imageProperties.maximumSize.height = 100
        // cell 속성 설정
        cell.contentConfiguration = content
        
        return cell
    }*/
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lblMember.text = "\(bts[indexPath.row])"
    }


}

