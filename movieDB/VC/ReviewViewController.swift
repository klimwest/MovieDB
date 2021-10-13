//
//  ReviewViewController.swift
//  movieDB
//
//  Created by West on 11.10.21.
//

import UIKit
import Kingfisher

class ReviewViewController: UIViewController {

    var imageView = UIImageView()
    var background = UIImageView()
    var movieTitle = UILabel()
    var overview = UILabel()
    var rating = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        print(movieTitle)
    }
    
    func setUI() {
        view.backgroundColor = .black
        background.contentMode = .scaleAspectFill
        background.layer.cornerRadius = 20
        background.clipsToBounds = true
        view.addSubview(background)
        background.snp.makeConstraints { maker in
            maker.top.bottom.right.left.equalTo(view).inset(0)
        }
        
        let viewForImageView = UIView()
        viewForImageView.backgroundColor = .white
        viewForImageView.layer.cornerRadius = 20
        view.addSubview(viewForImageView)
        viewForImageView.snp.makeConstraints { maker in
            maker.top.equalTo(view).inset(120)
            maker.left.equalTo(view).inset(15)
            maker.right.equalTo(view).inset(15)
            maker.bottom.equalTo(view).inset(view.frame.size.height / 2)
        }
        let viewForText = UIView()
        viewForText.backgroundColor = .gray
        viewForText.layer.cornerRadius = 20
        viewForText.alpha = 0.8
        view.addSubview(viewForText)
        viewForText.snp.makeConstraints { maker in
            maker.left.right.equalTo(view).inset(15)
            maker.top.equalTo(view).inset(view.frame.size.height / 1.9)
            maker.bottom.equalTo(view).inset(100)
        }
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        imageView.snp.makeConstraints { maker in
            maker.top.bottom.right.left.equalTo(viewForImageView).inset(5)
        }
        movieTitle.textColor = .white
        movieTitle.alpha = 0.8
        movieTitle.textAlignment = .center
        movieTitle.font = .boldSystemFont(ofSize: 20)
        view.addSubview(movieTitle)
        movieTitle.snp.makeConstraints { maker in
            maker.left.right.top.equalTo(viewForText).inset(15)
        }
        overview.textColor = .white
        overview.alpha = 0.8
        overview.textAlignment = .left
        overview.numberOfLines = 0
        view.addSubview(overview)
        overview.snp.makeConstraints { maker in
            maker.left.right.equalTo(viewForText).inset(15)
            maker.top.equalTo(movieTitle).inset(20)
            maker.bottom.equalTo(viewForText).inset(view.frame.size.height / 7)
        }
        rating.textColor = .yellow
        rating.alpha = 0.8
        rating.font = .boldSystemFont(ofSize: 20)
        rating.textAlignment = .center
        view.addSubview(rating)
        rating.snp.makeConstraints { maker in
            maker.left.bottom.equalTo(viewForText).inset(15)
        }
    }
    

    
}
