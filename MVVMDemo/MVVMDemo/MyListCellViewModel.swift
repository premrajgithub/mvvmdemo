//
//  MyListCellViewModel.swift
//  MVVMDemo
//
//  Created by Jayanthi Baskar on 29/09/20.
//  Copyright © 2020 cybaze. All rights reserved.
//

import Foundation

class MyListCellViewModel: NSObject {
    weak var myListCell:MyListCell!

    var rowItem:Rows?{
        didSet {
            DispatchQueue.main.async {
                self.myListCell.titleLabel.text = self.rowItem?.title
                self.myListCell.descriptionLabel.text = self.rowItem?.description
            }
        }
    }
}


