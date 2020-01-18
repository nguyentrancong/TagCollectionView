//
//  HomeModel.swift
//  TagCollectionView
//
//  Created by Nguyen Tran Cong on 1/18/20.
//  Copyright © 2020 Nguyen Tran. All rights reserved.
//

import Foundation

class HomeModel {
    
    let title: String
    let data: [String]
    
    init(_ title: String, _ data: [String]) {
        self.title = title
        self.data = data
    }
}
