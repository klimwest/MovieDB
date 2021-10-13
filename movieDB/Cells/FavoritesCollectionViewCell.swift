//
//  FavoritesCollectionViewCell.swift
//  movieDB
//
//  Created by West on 12.10.21.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    
    static let indetifier = "FavoritesCollectionViewCell"
    var array = UserDefaults.standard.value([Likes].self, forKey: "likes")
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "222")
        imageView.backgroundColor = .green
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let movieTitle: UILabel = {
        let title = UILabel()
        title.text = "Title of movie"
        title.textAlignment = .center
        title.font = .boldSystemFont(ofSize: 17)
        return title
    }()
    
    let yearAndGenre: UILabel = {
        let text = UILabel()
        text.text = "Year/genre"
        text.textAlignment = .center
        return text
    }()
    
    func fav(with index: Int) {
        guard let unArray = array else { return }
        movieTitle.text = unArray[index - 1].title
        yearAndGenre.text = unArray[index - 1].yearAndGenre
        movieTitle.text = unArray[index - 1].title
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.addSubview(movieTitle)
        contentView.addSubview(posterImageView)
        contentView.addSubview(yearAndGenre)
        contentView.layer.cornerRadius = 30
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        yearAndGenre.frame = CGRect(x: contentView.frame.size.width / 2.5,
                                    y: 50,
                                    width: contentView.frame.size.width / 2,
                                    height: contentView.frame.size.height / 4)
        
        movieTitle.frame = CGRect(x: contentView.frame.size.width / 2.5,
                                  y: 10,
                                  width: contentView.frame.size.width / 2,
                                  height: contentView.frame.size.height / 4)
        
        posterImageView.frame = CGRect(x: 10,
                                       y: 10,
                                       width: contentView.frame.size.width / 3,
                                       height: contentView.frame.size.height - 20)
    }
    
}
