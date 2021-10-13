//
//  MainTabViewController.swift
//  movieDB
//
//  Created by West on 11.10.21.
//

import UIKit

class MainTabViewController: UIViewController {
    
    var collectionView: UICollectionView?
    var resultsPopular = [Results]()
    var resultsUpcoming = [ResultsUpcoming]()
    var page = 1
    var index = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Main"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(swipeIsGoing))
        self.requestPopular()
        self.requestUpcoming()
        self.addCollection()
        collectionView?.refreshControl = UIRefreshControl()
        collectionView?.refreshControl?.addTarget(self, action: #selector(swipeIsGoing), for: .valueChanged)
    }
    
    @objc func swipeIsGoing() {
        page += 1
        self.requestPopular()
        self.requestUpcoming()
        DispatchQueue.main.async {
            self.collectionView?.refreshControl?.endRefreshing()
        }
    }
    
    @objc func addToFav() {
        
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
        collectionView.register(MainCollectionViewCell.self,forCellWithReuseIdentifier: MainCollectionViewCell.indetifier)
        collectionView.register(UpcomingCollectionViewCell.self, forCellWithReuseIdentifier: UpcomingCollectionViewCell.indetifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(0)
            maker.top.equalTo(view).inset(0)
            maker.bottom.equalToSuperview().inset(0)
        }
    }
    
    func requestPopular() {
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=31ef274399f96d546ddde6be201865ac&language=en-US&page=\(page)"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil, let data = data {
                do {
                    let movie = try JSONDecoder().decode(Movie.self, from: data)
                    self.resultsPopular = movie.results
                    guard let collectionView = self.collectionView else { return }
                    DispatchQueue.main.async {
                        collectionView.reloadData()
                    }
                } catch {
                    print("Error: \(error)")
                }
            }
        }
        task.resume()
    }
    
    func requestUpcoming() {
        let urlString = "https://api.themoviedb.org/3/movie/upcoming?api_key=31ef274399f96d546ddde6be201865ac&language=en-US&page=\(page)"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil, let data = data {
                do {
                    let movie = try JSONDecoder().decode(Upcoming.self, from: data)
                    self.resultsUpcoming = movie.results
                    guard let collectionView = self.collectionView else { return }
                    DispatchQueue.main.async {
                        collectionView.reloadData()
                    }
                } catch {
                    print("Error: \(error)")
                }
            }
        }
        task.resume()
    }
    
}

extension MainTabViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return resultsUpcoming.count
        }
        return resultsPopular.count
    }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if indexPath.section == 1 {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let controller = storyboard.instantiateViewController(withIdentifier: "ReviewViewController") as? ReviewViewController else { return }
                let image = resultsUpcoming[indexPath.item].backdrop_path
                let poster = resultsUpcoming[indexPath.item].poster_path
                guard let urlImage = URL(string: "https://image.tmdb.org/t/p/w500\(image)") else { return }
                guard let urlPoster = URL(string: "https://image.tmdb.org/t/p/w500\(poster)") else { return }
                
                controller.overview.text = resultsUpcoming[indexPath.item].overview
                controller.movieTitle.text = resultsUpcoming[indexPath.item].title
                controller.rating.text = "Rating is \(resultsUpcoming[indexPath.item].vote_average)"
                controller.imageView.kf.setImage(with: urlImage)
                controller.background.kf.setImage(with: urlPoster)
                navigationController?.pushViewController(controller, animated: true)
            }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let controller = storyboard.instantiateViewController(withIdentifier: "ReviewViewController") as? ReviewViewController else { return }
            let image = resultsPopular[indexPath.item].backdrop_path
            let poster = resultsPopular[indexPath.item].poster_path
            guard let urlImage = URL(string: "https://image.tmdb.org/t/p/w500\(image)") else { return }
            guard let urlPoster = URL(string: "https://image.tmdb.org/t/p/w500\(poster)") else { return }
            //Set a cell values
            controller.overview.text = resultsPopular[indexPath.item].overview
            controller.movieTitle.text = resultsPopular[indexPath.item].title
            controller.rating.text = "Rating is \(resultsPopular[indexPath.item].vote_average)"
            controller.imageView.kf.setImage(with: urlImage)
            controller.background.kf.setImage(with: urlPoster)
            navigationController?.pushViewController(controller, animated: true)
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if indexPath.section == 1 {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.indetifier, for: indexPath) as? UpcomingCollectionViewCell else { return UICollectionViewCell() }
                
                let image = resultsUpcoming[indexPath.item].backdrop_path
                guard let urlImage = URL(string: "https://image.tmdb.org/t/p/w500\(image)") else { return UICollectionViewCell()}
                
                cell.movieTitle.text = resultsUpcoming[indexPath.item].title
                cell.yearAndGenre.text = resultsUpcoming[indexPath.item].release_date
                cell.posterImageView.kf.setImage(with: urlImage)
                return cell
            }
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.indetifier, for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
            
            let image = resultsPopular[indexPath.item].backdrop_path
            guard let urlImage = URL(string: "https://image.tmdb.org/t/p/w500\(image)") else { return UICollectionViewCell()}
            
            cell.movieTitle.text = resultsPopular[indexPath.item].title
            cell.yearAndGenre.text = resultsPopular[indexPath.item].release_date
            cell.posterImageView.kf.setImage(with: urlImage)
            cell.likeButton.addTarget(self, action: #selector(addToFav), for: .touchUpInside)
            return cell
        }
    
}
