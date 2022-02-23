//
//  ProductView.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 9.02.22.
//

import UIKit

class ProductView: UIView {
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let detailLabel = UILabel()
    private let priceLabel = UILabel()
    private let gradeLabel = UILabel()
    
    var onTapped: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        createImage()
        createNameLabel()
        createDetatilLabel()
        createPriceLabel()
        createGradeLabel()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
        addGestureRecognizer(gesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapOnView() {
        onTapped?()
    }

    private func createImage() {
        addSubview(imageView)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func createNameLabel() {
        addSubview(nameLabel)
        
        nameLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            nameLabel.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func createDetatilLabel() {
        addSubview(detailLabel)
        
        detailLabel.font = .systemFont(ofSize: 10, weight: .thin)
        
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            detailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            detailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            detailLabel.heightAnchor.constraint(equalToConstant: 20),
            detailLabel.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func createPriceLabel() {
        addSubview(priceLabel)
        
        priceLabel.font = .systemFont(ofSize: 10, weight: .bold)
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            priceLabel.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            priceLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func createGradeLabel() {
        addSubview(gradeLabel)
        
        gradeLabel.font = .systemFont(ofSize: 10, weight: .bold)
        
        gradeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            gradeLabel.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 10),
            gradeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            gradeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            gradeLabel.heightAnchor.constraint(equalToConstant: 20),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

    func configOf(product: Product) {
        imageView.image = product.image
        nameLabel.text = product.name
        detailLabel.text = "EEEE"
        priceLabel.text = "\(product.price)p."
        gradeLabel.text = "5.0*"
    }
}
