//
//  UIView+Ext.swift
//  MVVMDemo
//
//  Created by Jayanthi Baskar on 28/09/20.
//  Copyright © 2020 cybaze. All rights reserved.
//

import UIKit

extension UIView {
    func pinEdge(_ to:UIView) {
        translatesAutoresizingMaskIntoConstraints    = false
        topAnchor.constraint(equalTo: superview!.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview!.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview!.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview!.bottomAnchor).isActive = true
    }
}
