//
//  ViewController.swift
//  BTSTableView3-MultiSection
//
//  Created by Lia An on 9/3/24.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    let bts = ["RM","진","슈가","제이홉","지민","뷔","정국"]
    var exo = ["시우민","디오","첸","백현","세훈","카이","루한","레이","찬열","수호","크리스","타오"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - DataSource Delegate Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
//    ???: - 잘 모르겠는데
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? bts.count : exo.count
    }

//    TODO: - things to do
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idol", for: indexPath)
        var config = cell.defaultContentConfiguration()
        if indexPath.section == 0 {
            config.text = bts[indexPath.row]
        } else {
            config.text = exo[indexPath.row]
        }
    
        cell.contentConfiguration = config
        
        // TODO: - accessory
        switch indexPath.row % 5 {
        case 0: cell.accessoryType = .checkmark
        case 1: cell.accessoryType = .detailButton
        case 2: cell.accessoryType = .detailDisclosureButton
        case 3: cell.accessoryType = .disclosureIndicator
        case 4: cell.accessoryType = .none
        default:
            cell.accessoryType = .none
        }
        
        return cell
    }

//    FIXME: - 수정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "bts" : "exo"
    }
    
//    !!!: - 경고. 전달된 값이 nil이 아니어야함
    // Delegate 메서드
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.contentMode = .left
        
        if section == 0 {
            imageView.image = UIImage(systemName: "person.3.fill")
        } else {
            imageView.image = UIImage(systemName: "person.3")
        }
        
        return imageView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }


}

