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
    
    // MARK: App lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupContainer()
        createSegmentSelect()
    }
    
    // MARK: Setup
    
    private func setupContainer() {
        view1 = MapStoreController().view
        view2 = StoreListController().view
        view.addSubview(container)
        container.addSubview(view1)
        container.addSubview(view2)
        
        let window = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window
        let topPadding = window?.safeAreaInsets.top ?? .zero
        
        container.snp.makeConstraints { make in
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
        container.bringSubviewToFront(view1)
        segmentControl.addTarget(self, action: #selector(changeView), for: .valueChanged)
        view.addSubview(segmentControl)
        
        let window = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window
        let topPadding = window?.safeAreaInsets.top ?? .zero
        
        segmentControl.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(topPadding )
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    @objc private func changeView(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            container.bringSubviewToFront(view1)
            break
        case 1:
            container.bringSubviewToFront(view2)
            break
        default:
            break
        }
    }
}
