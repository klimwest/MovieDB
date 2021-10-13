//
//  FavoritesTabViewController.swift
//  movieDB
//
//  Created by West on 11.10.21.
//

import UIKit

class FavoritesTabViewController: UIViewController {
    
    var collectionView: UICollectionView?
    var array = UserDefaults.standard.value([Likes].self, forKey: "likes")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Favorites"
        self.addCollection()
    }
    
    func addCollection() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10,
                                           left: 0,
                                           bottom: 0,
                                           right: 0)
        layout.itemSize = CGSize(width: view.frame.size.width - 20,
                                 height: view.frame.size.width / 3)
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.register(FavoritesCollectionViewCell.self, forCellWithReuseIdentifier: FavoritesCollectionViewCell.indetifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .black
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(0)
            maker.top.equalToSuperview().inset(0)
            maker.bottom.equalToSuperview().inset(0)
        }
    }
    
}

extension FavoritesTabViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let array = UserDefaults.standard.value([Likes].self, forKey: "likes") ?? [Likes]()
    
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritesCollectionViewCell.indetifier, for: indexPath) as? FavoritesCollectionViewCell else { return UICollectionViewCell() }
//        guard let unArray = array else { return UICollectionViewCell() }
        let array = UserDefaults.standard.value([Likes].self, forKey: "likes") ?? [Likes]()
        cell.movieTitle.text = array[indexPath.item].title
        
        return cell
    }
    
    
}
