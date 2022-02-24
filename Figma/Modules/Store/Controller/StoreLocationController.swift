//
//  StoreLocationController.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 8.02.22.
//

import Foundation
import UIKit
import SnapKit

// MARK: Constants

fileprivate struct Constants {
    static let cellIdentificator = "cell"
    static let shopTableHeightDevider: CGFloat = 4
    static let segmentItems = ["Карты", "Список"]
    static let bottomPadding: CGFloat = 80
}

class StoreLocationController: UIViewController {
    
    // MARK: Property
    
    private var segmentControl = UISegmentedControl()
    
    private var container = UIView()
    private var view1 = UIView()
    private var view2 = UIView()
    
    private let map = MapStoreController()
    private let list = StoreListController()
    
    // MARK: App lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupContainer()
        createSegmentSelect()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.navigationBar.isTranslucent = false
    }
    
    // MARK: Setup
    
    private func setupContainer() {
        view1 = map.view
        view2 = list.view
        view1.isHidden = false
        view2.isHidden = true
        view.addSubview(view1)
        view.addSubview(view2)
        
        let window = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window
        let topPadding = window?.safeAreaInsets.top ?? .zero
        
        view1.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(topPadding)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(Constants.bottomPadding)
        }
        view2.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(topPadding)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(Constants.bottomPadding)
        }
    }
    
    // MARK: Methods create views elements
    
    private func createSegmentSelect() {
        segmentControl = UISegmentedControl(items: Constants.segmentItems)
        segmentControl.selectedSegmentIndex = .zero
            
        segmentControl.addTarget(self, action: #selector(changeView), for: .valueChanged)
        view.addSubview(segmentControl)
        
        let window = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window
        let topPadding = window?.safeAreaInsets.top ?? .zero
        
        segmentControl.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(topPadding)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    @objc private func changeView(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            view1.isHidden = false
            view2.isHidden = true
            break
        case 1:
            view1.isHidden = true
            view2.isHidden = false
            break
        default:
            break
        }
    }
}
