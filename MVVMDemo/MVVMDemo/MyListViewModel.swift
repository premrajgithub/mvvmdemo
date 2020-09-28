//
//  MyListViewModel.swift
//  MVVMDemo
//
//  Created by Jayanthi Baskar on 29/09/20.
//  Copyright © 2020 cybaze. All rights reserved.
//

import Foundation

class MyListViewModel: NSObject {
    
    weak var listView:MyListViewController?{
        didSet {
            
        }
    }
    
    var coutryDetail:CountryDetail! {
        didSet{
            self.listView?.rows = self.coutryDetail.rows
        }
    }
    
    func fetchCountryDetails() {
        
        if let path = Bundle.main.path(forResource: "countryDetail", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
                self.coutryDetail = try jsonDecoder.decode(CountryDetail.self, from: data)
            } catch {
                print("JSONSerialization error:", error)
            }
            
        }
        
        
    }
    
}

