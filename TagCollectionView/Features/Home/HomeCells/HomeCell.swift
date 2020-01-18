//
//  HomeCell.swift
//  TagCollectionView
//
//  Created by Nguyen Tran Cong on 1/17/20.
//  Copyright © 2020 Nguyen Tran. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    static let identifier = "HomeCell"
    
    let lbText: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    var maxWidth: CGFloat? = nil {
        didSet {
            guard let maxWidth = maxWidth else { return }
            lbText.widthAnchor.constraint(equalToConstant: maxWidth).isActive = true
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}

private extension HomeCell {
    private func setupViews() {
        addSubview(lbText)
        NSLayoutConstraint.activate([
            lbText.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            lbText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            lbText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            lbText.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6)
        ])
    }
    
}
