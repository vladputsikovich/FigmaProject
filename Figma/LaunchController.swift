//
//  LaunchController.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 6.02.22.
//

import Foundation
import UIKit
import SnapKit

// MARK: Constants

fileprivate struct Constants {
    static let appName = "APPNAME"
    static let logoImageName = "bag"
}

class LaunchController: UIViewController {
    
    private var logoImage = UIImageView()
    private var gradient = GradientView()
    private var appName = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }
    
    func createView() {
        gradient = GradientView(frame: view.frame)
        view.addSubview(gradient)
        logoImage.image = UIImage(named: Constants.logoImageName)
        appName.text = Constants.appName
        appName.font = .boldSystemFont(ofSize: 30)
        appName.textAlignment = .center
        gradient.addSubview(logoImage)
        gradient.addSubview(appName)
        
        
        logoImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(view.frame.width / 2 - 75)
            make.top.equalToSuperview().inset(200)
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
        appName.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(400)
            make.left.equalToSuperview().inset(view.frame.width / 2 - 75)
            make.width.equalTo(150)
        }
    }
}
