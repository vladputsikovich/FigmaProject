//
//  CatalogViewController.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 8.02.22.
//

import Foundation
import UIKit

// MARK: Constants

fileprivate struct Constants {
    static let stackViewSpacing: CGFloat = 10
    static let advertViewSpacing: CGFloat = 20
    static let catalogViewSpacing: CGFloat = 30
    static let countItemOnView = 3
    static let searchBarPlaceHolder = "Поиск"
    static let segmentItems = ["Цена", "Рейтинг", "Заказы"]
}

class CatalogViewController: UIViewController {
    
    // MARK: Properties
    
    private let catalogStackView = UIStackView()
    private let catalogScrollView = UIScrollView()
    private let contentView = UIView()
    
    private let searchBar = UISearchBar()
    
    private var segmentFilter = UISegmentedControl()
    
    private let topProductStackView = UIStackView()
    private let topProductScrollView = UIScrollView()
    private let topProductContentView = UIView()
    
    private let advertStackView = UIStackView()
    private let advertScrollView = UIScrollView()
    private let advertContentView = UIView()
    
    private var productScrollView = UIScrollView()
    private var productStackView = UIStackView()
    private let productContentView = UIView()
    
    private var pageControl = UIPageControl()
    
    private var searchProducts = [Product]()
    
    private var menu = Menu()
    
    // MARK: APP Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createStackView()
        createSearchBar()
        createSegmentFilter()
        createTopProductStackView()
        createAdvertStackView()
        createProductsStackView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.isNavigationBarHidden = true
        catalogScrollView.contentSize = CGSize(width: view.frame.width, height: catalogStackView.frame.height)
        topProductScrollView.contentSize = CGSize(width: topProductStackView.frame.width + 20, height: .zero)
        advertScrollView.contentSize = CGSize(width: advertStackView.frame.width, height: .zero)
        productScrollView.contentSize = CGSize(width: view.frame.width, height: productStackView.frame.height)
    }
    
    // MARK: Methods for create views
    
    private func createStackView() {
        catalogStackView.axis = .vertical
        catalogStackView.distribution = .fillProportionally
        catalogStackView.spacing = Constants.stackViewSpacing
        view.addSubview(catalogScrollView)
        catalogScrollView.addSubview(contentView)
        contentView.addSubview(catalogStackView)
        
        catalogScrollView.showsVerticalScrollIndicator = false
        
        catalogStackView.translatesAutoresizingMaskIntoConstraints = false
        catalogScrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let contstraints = [
            catalogScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            catalogScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            catalogScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            catalogScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: catalogScrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: catalogScrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            contentView.centerXAnchor.constraint(equalTo: catalogScrollView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: catalogScrollView.centerYAnchor),
            
            catalogStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            catalogStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            catalogStackView.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor),
            catalogStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ]
        
        NSLayoutConstraint.activate(contstraints)
    }
    
    private func createSearchBar() {
        searchBar.placeholder = Constants.searchBarPlaceHolder
        catalogStackView.addArrangedSubview(searchBar)
    }
    
    private func createSegmentFilter() {
        segmentFilter = UISegmentedControl(items: Constants.segmentItems)
        segmentFilter.selectedSegmentIndex = .zero
        catalogStackView.addArrangedSubview(segmentFilter)
    }
    
    private func createTopProductStackView() {
        topProductStackView.axis = .horizontal
        topProductStackView.distribution = .fillEqually
        topProductStackView.alignment = .center
        topProductStackView.spacing = Constants.stackViewSpacing
        
        topProductScrollView.showsHorizontalScrollIndicator = false
        topProductScrollView.addSubview(topProductContentView)
        topProductContentView.addSubview(topProductStackView)
        catalogStackView.addArrangedSubview(topProductScrollView)
        
        topProductStackView.translatesAutoresizingMaskIntoConstraints = false
        topProductContentView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            topProductContentView.topAnchor.constraint(equalTo: topProductScrollView.topAnchor),
            topProductContentView.leadingAnchor.constraint(equalTo: topProductScrollView.leadingAnchor),
            topProductContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topProductContentView.centerXAnchor.constraint(equalTo: topProductScrollView.centerXAnchor),
            topProductContentView.centerYAnchor.constraint(equalTo: topProductScrollView.centerYAnchor),
            
            topProductStackView.topAnchor.constraint(
                equalTo: topProductContentView.topAnchor,
                constant: 0
            ),
            topProductStackView.leadingAnchor.constraint(
                equalTo: topProductContentView.leadingAnchor,
                constant: 10
            ),
            topProductStackView.bottomAnchor.constraint(
                equalTo: topProductContentView.bottomAnchor,
                constant: 0
            ),
            topProductStackView.trailingAnchor.constraint(
                greaterThanOrEqualTo: topProductContentView.trailingAnchor,
                constant: 0
            ),
       
        ]
        NSLayoutConstraint.activate(constraints)
        
        menu.products.forEach { product in
            let productView = ProductView(frame: view.frame)
            productView.configOf(product: product)
            topProductStackView.addArrangedSubview(productView)
            productView.onTapped = {
                let vc = ProductViewController(product: product)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    private func createAdvertStackView() {
        advertStackView.axis = .horizontal
        advertStackView.distribution = .fillEqually
        advertStackView.alignment = .fill
        advertStackView.spacing = Constants.advertViewSpacing
        
        advertScrollView.isPagingEnabled = true
        advertScrollView.showsHorizontalScrollIndicator = false
        
        advertScrollView.addSubview(advertContentView)
        advertContentView.addSubview(advertStackView)
        catalogStackView.addArrangedSubview(advertScrollView)
        
        advertStackView.translatesAutoresizingMaskIntoConstraints = false
        advertContentView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            advertContentView.topAnchor.constraint(equalTo: advertScrollView.topAnchor),
            advertContentView.leadingAnchor.constraint(equalTo: advertScrollView.leadingAnchor),
            advertContentView.centerXAnchor.constraint(equalTo: advertScrollView.centerXAnchor),
            advertContentView.centerYAnchor.constraint(equalTo: advertScrollView.centerYAnchor),
            
            advertStackView.topAnchor.constraint(equalTo: advertContentView.topAnchor),
            advertStackView.leadingAnchor.constraint(equalTo: advertContentView.leadingAnchor),
            advertStackView.bottomAnchor.constraint(equalTo: advertContentView.bottomAnchor),
            advertStackView.trailingAnchor.constraint(greaterThanOrEqualTo: advertContentView.trailingAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        menu.adverts.forEach { advert in
            let advertView = AdvertView(frame: view.frame)
            advertView.configOf(advert: advert)
            advertStackView.addArrangedSubview(advertView)
        }
    }
    
    private func createProductsStackView() {
        productStackView.axis = .vertical
        productStackView.distribution = .fillEqually
        productStackView.alignment = .center
        productStackView.spacing = Constants.stackViewSpacing
        
        productScrollView.showsVerticalScrollIndicator = false
        productScrollView.addSubview(productContentView)
        productContentView.addSubview(productStackView)
        catalogStackView.addArrangedSubview(productScrollView)
        
        productStackView.translatesAutoresizingMaskIntoConstraints = false
        productContentView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            productContentView.topAnchor.constraint(equalTo: productScrollView.topAnchor),
            productContentView.leadingAnchor.constraint(equalTo: productScrollView.leadingAnchor),
            productContentView.centerXAnchor.constraint(equalTo: productScrollView.centerXAnchor),
            productContentView.centerYAnchor.constraint(equalTo: productScrollView.centerYAnchor),
            
            productStackView.topAnchor.constraint(equalTo: productContentView.topAnchor),
            productStackView.leadingAnchor.constraint(equalTo: productContentView.leadingAnchor),
            productStackView.bottomAnchor.constraint(equalTo: productContentView.bottomAnchor),
            productStackView.trailingAnchor.constraint(greaterThanOrEqualTo: productContentView.trailingAnchor),
       
        ]
        NSLayoutConstraint.activate(constraints)
        
        (0...menu.products.count / Constants.countItemOnView + 1).forEach { row in
            let horizontal = UIStackView()
            (1...Constants.countItemOnView).forEach { i in
                if (row * 2 + i) >= menu.products.count {
                    let emptyView = UIView()
                    horizontal.addArrangedSubview(emptyView)
                    return
                }
                let productView = ProductView(frame: view.frame)
                productView.configOf(product: menu.products[row * 2 + i])
                productView.onTapped = {
                    let vc = ProductViewController(product: self.menu.products[row * 2 + i])
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                horizontal.distribution = .fillEqually
                horizontal.axis = .horizontal
                horizontal.alignment = .top
                horizontal.addArrangedSubview(productView)
                horizontal.spacing = Constants.catalogViewSpacing
            }
            productStackView.addArrangedSubview(horizontal)
        }
    }
}

