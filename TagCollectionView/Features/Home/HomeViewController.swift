//
//  HomeViewController.swift
//  TagCollectionView
//
//  Created by Nguyen Tran Cong on 1/17/20.
//  Copyright © 2020 Nguyen Tran. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    typealias tilteContent = String
    typealias contentList = [String]
    typealias content = [tilteContent: contentList]
    
    let tagCollectionView: UICollectionView = {
        let layout = UICollectionViewCenterLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.estimatedItemSize = CGSize(width: 140, height: 40)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        return cv
    }()
    
    var data: [HomeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getData()
        configureViews()
        setupViews()
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].data.count
    }
    
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderReusableView.identifier, for: indexPath) as? HeaderReusableView else {
            fatalError("Can't dequeue reusable")
        }
        headerView.lbText.text = data[indexPath.section].title
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell else {
            fatalError("Can't dequeue reusable cell")
        }
        cell.lbText.text = data[indexPath.section].data[indexPath.row]
        cell.backgroundColor = .lightGray
        cell.layer.cornerRadius = 6
        return cell
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}

private extension HomeViewController {
    
    func getData() {
        let list1 = ["box 1", "box 200/kg", "box 100/thung", "box 10", "box 6d/kg"]
        let content1 = HomeModel("List 1", list1)
        data.append(content1)
        let list2 = ["box 1kg", "box 200", "box 100/kg", "box 10", "box 6d/kg","box 1", "box 200/kg", "box 100/thung", "box 10", "box 6d/kg"]
        let content2 = HomeModel("List 2", list2)
        data.append(content2)
        let content3 = HomeModel("List 3", list1)
        data.append(content3)
    }
    
    func configureViews() {
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        
        tagCollectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
        tagCollectionView.register(HeaderReusableView.self,
                                   forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                   withReuseIdentifier: HeaderReusableView.identifier)
    }
    
    func setupViews() {
        setupTagCollectionView()
    }
    
    func setupTagCollectionView() {
        view.addSubview(tagCollectionView)
        tagCollectionView.contentInset = .init(top: 40, left: 16, bottom: 40, right: 16)
        NSLayoutConstraint.activate([
            tagCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            tagCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tagCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tagCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
