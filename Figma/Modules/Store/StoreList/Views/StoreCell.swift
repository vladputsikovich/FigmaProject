//
//  StoreCell.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 8.02.22.
//

import UIKit

class StoreCell: UITableViewCell {

    // MARK: Properties
    
    private let nameLabel = UILabel()
    private let streetLabel = UILabel()
    private let cityLabel = UILabel()
    private let numberLabel = UILabel()
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Func for create Ui elemetnts
    
    private func createLabels() {
        addSubview(nameLabel)
        addSubview(streetLabel)
        addSubview(cityLabel)
        addSubview(numberLabel)
        
        nameLabel.textAlignment = .left
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        streetLabel.textAlignment = .left
        streetLabel.font = .systemFont(ofSize: 16, weight: .regular)
        cityLabel.textAlignment = .left
        cityLabel.font = .systemFont(ofSize: 15, weight: .thin)
        numberLabel.textAlignment = .left
        numberLabel.font = .systemFont(ofSize: 13, weight: .thin)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(16)
        }
        
        streetLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel).inset(30)
            make.left.equalToSuperview().inset(16)
        }
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(streetLabel).inset(30)
            make.left.equalToSuperview().inset(16)
        }
        
        numberLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel).inset(30)
            make.left.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
    }
    
    // MARK: Setup
    
    func setup(store: StoreAnotation) {
        nameLabel.text = store.name
        streetLabel.text = store.street
        cityLabel.text = store.city
        numberLabel.text = store.phoneNumber
    }
}
