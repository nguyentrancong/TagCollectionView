//
//  HeaderReusableView.swift
//  TagCollectionView
//
//  Created by Nguyen Tran Cong on 1/19/20.
//  Copyright © 2020 Nguyen Tran. All rights reserved.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {
    
    static let identifier: String = "HeaderReusableView"
    
    let lbText: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension HeaderReusableView {
    func setupViews() {
        self.addSubview(lbText)
        NSLayoutConstraint.activate([
            lbText.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            lbText.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lbText.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lbText.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
