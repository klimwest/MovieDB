import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let indetifier = "MainCollectionViewCell"
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "222")
        imageView.backgroundColor = .green
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let likeButton: UIButton = {
        let like = UIButton()
        like.layer.cornerRadius = 20
        let image = UIImage(named: "like_filled")
        like.setImage(image, for: .normal)
        return like
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.addSubview(movieTitle)
        contentView.addSubview(posterImageView)
        contentView.addSubview(yearAndGenre)
        contentView.addSubview(likeButton)
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
        
        likeButton.frame = CGRect(x: contentView.frame.size.width - 70,
                                  y: contentView.frame.size.height - 60,
                                  width: 60,
                                  height: 60)
    }
}
