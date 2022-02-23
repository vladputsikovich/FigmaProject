//
//  ProductView.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 9.02.22.
//

import UIKit

// MARK: Constants

fileprivate struct Constants {
    static let imageCornerRadius: CGFloat = 10
    static let nameLabelFontSize: CGFloat = 15
    static let detailLabelFontSize: CGFloat = 10
    static let priceLabelFontSize: CGFloat = 10
    static let gradeLabelFontSize: CGFloat = 10
}

class ProductView: UIView {
    
    // MARK: Properties
    
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let detailLabel = UILabel()
    private let priceLabel = UILabel()
    private let gradeLabel = UILabel()
    
    var onTapped: (() -> ())?
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    private func setup() {
        backgroundColor = .white
        createImage()
        createNameLabel()
        createDetatilLabel()
        createPriceLabel()
        createGradeLabel()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
        addGestureRecognizer(gesture)
    }
    
    // MARK: Func check tape
    
    @objc func tapOnView() {
        onTapped?()
    }

    // MARK: Func for create UI elements
    
    private func createImage() {
        addSubview(imageView)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Constants.imageCornerRadius
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: frame.width / 3),
            imageView.widthAnchor.constraint(equalToConstant: frame.width / 4)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func createNameLabel() {
        addSubview(nameLabel)
        
        nameLabel.font = .systemFont(ofSize: Constants.nameLabelFontSize, weight: .semibold)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            nameLabel.widthAnchor.constraint(equalToConstant: bounds.width / 4)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func createDetatilLabel() {
        addSubview(detailLabel)
        
        detailLabel.font = .systemFont(ofSize: Constants.detailLabelFontSize, weight: .thin)
        
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            detailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            detailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            detailLabel.heightAnchor.constraint(equalToConstant: 20),
            detailLabel.widthAnchor.constraint(equalToConstant: frame.width / 4)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func createPriceLabel() {
        addSubview(priceLabel)
        
        priceLabel.font = .systemFont(ofSize: Constants.priceLabelFontSize, weight: .bold)
        
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
        
        gradeLabel.font = .systemFont(ofSize: Constants.gradeLabelFontSize, weight: .bold)
        
        gradeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            gradeLabel.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 10),
            gradeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            gradeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            gradeLabel.heightAnchor.constraint(equalToConstant: 20),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: Config
    
    func configOf(product: Product) {
        imageView.image = product.image
        nameLabel.text = product.name
        detailLabel.text = "EEEE"
        priceLabel.text = "\(product.price)p."
        gradeLabel.text = "5.0*"
    }
}
