//
//  MyListViewController.swift
//  MVVMDemo
//
//  Created by Jayanthi Baskar on 28/09/20.
//  Copyright © 2020 cybaze. All rights reserved.
//

import UIKit

class MyListViewController: UIViewController {

    var tableView = UITableView()
    var rows:[Rows]?{
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableview()
        let mylistViewModel = MyListViewModel()
        mylistViewModel.listView = self
        mylistViewModel.fetchCountryDetails()
    }
    
    func configureTableview() {
        view.addSubview(tableView)
        self.setDelegates()
//        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(MyListCell.self, forCellReuseIdentifier: CellIdentifiers.myCell)
        
        tableView.pinEdge(view)
        tableView.separatorStyle = .none
        
        
    }
    
    func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MyListViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.myCell) as! MyListCell
        cell.selectionStyle = .none
        let row = self.rows![indexPath.row]
        cell.setCell(row)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableViewAutomaticDimension
    }
    
    
}
