//
//  TableView.swift
//  SwiftUI-UIKit1
//
//  Created by Lia An on 11/7/24.
//

import SwiftUI
import UIKit

struct TableView: UIViewRepresentable {
    func makeUIView(context: Context) -> UITableView {
        // SwiftUI는 기본적으로 자기가 들어갈 공간이 정해져있으므로, 정해주지 않아도 됨.
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = context.coordinator
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        uiView.reloadData()
    }
    
    func makeCoordinator() -> TableViewCoordinator {
        TableViewCoordinator()
    }
    
    class TableViewCoordinator: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            10
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            var config = cell.defaultContentConfiguration()
            config.text = "\(indexPath.row)번째 row"
            cell.contentConfiguration = config // 넣어줘야 나옴.
            return cell
        }
    }
}

#Preview {
    TableView()
}
