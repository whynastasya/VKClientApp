//
//  FriendCollectionViewController.swift
//  vk
//
//  Created by nastasya on 01.07.2023.
//

import UIKit

final class FriendCollectionViewController: UICollectionViewController {

    var friend = User(fullname: "", avatar: "", publications: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(FriendCollectionViewCell.self, forCellWithReuseIdentifier: FriendCollectionViewCell.identifier)
        setupCollectionViewFlowLayout()
        navigationItem.title = friend.fullname
    }

    private func setupCollectionViewFlowLayout() {
        let flowlayout = UICollectionViewFlowLayout()
        let cellDimension = view.bounds.width / 2 - 2
        flowlayout.itemSize = CGSizeMake(cellDimension, cellDimension)
        flowlayout.minimumLineSpacing = 2
        flowlayout.minimumInteritemSpacing = 0
        flowlayout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        collectionView.collectionViewLayout = flowlayout
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        friend.publications.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: FriendCollectionViewCell.identifier,
            for: indexPath
        ) as! FriendCollectionViewCell
        cell.configure(with: friend.publications[indexPath.row])
        return cell
    }
}
