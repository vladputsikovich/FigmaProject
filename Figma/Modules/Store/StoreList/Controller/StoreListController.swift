//
//  ShopListController.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 8.02.22.
//

import Foundation
import UIKit
import SnapKit
import MapKit

// MARK: Constants

fileprivate struct Constants {
    static let cellIdentificator = "storeCell"
    static let shopTableHeightDevider: CGFloat = 4
}

class StoreListController: UIViewController {
    
    // MARK: Properties
    
    private let shopsList = Shops()
    private let shopTable = UITableView()
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
        view.backgroundColor = .white
    }
    
    // MARK: Func for create view elements
    
    private func createTable() {
        view.addSubview(shopTable)
        shopTable.delegate = self
        shopTable.dataSource = self
        shopTable.register(StoreCell.self, forCellReuseIdentifier: Constants.cellIdentificator)
        
        let window = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window
        let topPadding = window?.safeAreaInsets.top ?? .zero
        
        shopTable.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(topPadding + 10)
            make.left.equalToSuperview()
            make.width.equalTo(view.frame.width)
            make.height.equalTo(view.frame.height - view.frame.height / Constants.shopTableHeightDevider)
        }
    }
}

// MARK: UITableViewDelegate

extension StoreListController: UITableViewDelegate {
    
}

// MARK: UITableViewDataSource

extension StoreListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopsList.shops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellIdentificator,
            for: indexPath
        ) as? StoreCell else { return  UITableViewCell() }
        let currentStore = shopsList.shops[indexPath.item]
        MapService().infoCurrentLocation(
            location: CLLocation(latitude: currentStore.latitude, longitude: currentStore.longitude),
            name: currentStore.name,
            phoneNumber: currentStore.phoneNumber) { store in
                cell.setup(store: store ?? StoreAnotation(name: "", street: "", city: "", phoneNumber: ""))
            }
        return cell
    }
}
