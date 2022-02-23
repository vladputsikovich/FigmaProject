//
//  AdvertView.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 9.02.22.
//

import UIKit

class AdvertView: UIView {
    
    // MARK: Properties
    
    private let imageView = UIImageView()
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        createImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Func for create UI elements
    
    private func createImage() {
        addSubview(imageView)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: frame.width - 20)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: Config
    
    func configOf(advert: Advert) {
        imageView.image = advert.image
    }
}

