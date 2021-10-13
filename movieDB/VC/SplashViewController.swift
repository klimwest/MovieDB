//
//  ViewController.swift
//  movieDB
//
//  Created by West on 7.10.21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        //image
        view.backgroundColor = .black
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        view.addSubview(imageView)
        imageView.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
        }
        //activity indicator
        let spinner = UIActivityIndicatorView()
        spinner.color = .white
        spinner.style = .medium
        spinner.startAnimating()
        view.addSubview(spinner)
        spinner.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(imageView).inset(200)
        }
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}

