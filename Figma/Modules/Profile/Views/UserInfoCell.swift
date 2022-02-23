//
//  UserInfoCell.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 6.02.22.
//

import UIKit
import SnapKit

struct InfoUser {
    var infoLabel: String
    var dataLabel: String
}

class UserInfoCell: UITableViewCell {

    // MARK: Properties
    
    private let infoLabel = UILabel()
    private let dataLabel = UILabel()
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Func for create UI elements
    
    private func createLabels() {
        addSubview(infoLabel)
        addSubview(dataLabel)
        
        infoLabel.textAlignment = .left
        infoLabel.font = .systemFont(ofSize: 16, weight: .thin)
        dataLabel.textAlignment = .left
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(frame.height / 5)
            make.left.equalToSuperview().inset(frame.height / 6)
            make.bottom.equalToSuperview().inset(frame.height / 5)
            make.right.equalToSuperview().inset(frame.width / 2)
        }
        
        dataLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(frame.height / 5)
            make.left.equalToSuperview().inset(frame.width / 2)
            make.bottom.equalToSuperview().inset(frame.height / 5)
            make.right.equalToSuperview().inset(frame.height / 6)
        }
    }
    
    // MARK: Congig
    
    func config(info: InfoUser) {
        infoLabel.text = info.infoLabel
        dataLabel.text = info.dataLabel
    }
}
