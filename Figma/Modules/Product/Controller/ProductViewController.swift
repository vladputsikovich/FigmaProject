//
//  ProductViewController.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 7.02.22.
//

import Foundation
import UIKit

class ProductViewController: UIViewController {
    
    // MARK: Properties
    
    private var productModel: Product?
    
    private let scrollView = UIScrollView()
    private let contentStackView = UIStackView()
    private let contentView = UIView()
    
    private let productImage = UIImageView()

    private let productInfoStackView = UIStackView()
    private let productName = UILabel()
    private let categoryName = UILabel()
    private let detailInfo = UILabel()
    private let price = UILabel()
    
    private let commentTable = IntrinsicTableView()
    
    // MARK: Init
    
    init(product: Product) {
        self.productModel = product
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: App lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createScrollView()
        createProductImage()
        createProductInfoStackView()
        createTableComments()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(width: view.frame.width, height: contentStackView.frame.height)
    }
    
    // MARK: Func for create UI elements
    
    private func createScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(contentStackView)
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.axis = .vertical
        contentStackView.distribution = .equalSpacing
        contentStackView.alignment = .fill
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            contentStackView.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: 0),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func createProductImage() {
        contentStackView.addArrangedSubview(productImage)
        productImage.image = productModel?.image
        
        let constraints = [
            productImage.widthAnchor.constraint(equalToConstant: 200),
            productImage.heightAnchor.constraint(equalToConstant: 350),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func createProductInfoStackView() {
        contentStackView.addArrangedSubview(productInfoStackView)
        productInfoStackView.alignment = .leading
        productInfoStackView.axis = .vertical
        productInfoStackView.distribution = .fillProportionally
        productInfoStackView.spacing = 10
        
        productName.text = productModel?.name
        productName.textAlignment = .left
        productName.font = .systemFont(ofSize: 30, weight: .bold)
        productInfoStackView.addArrangedSubview(productName)
        
        categoryName.text = "Ноутбуки"
        categoryName.textAlignment = .left
        categoryName.font = .systemFont(ofSize: 10, weight: .thin)
        productInfoStackView.addArrangedSubview(categoryName)
        
        detailInfo.text = "rfisdmfndif insdfij nnsdf sndoifn insdf oinsdf onsdof ываотыоватдыватдывтадт дтывдоат олывтад лвтадыва дывыат одытвоад ты ввады тодвалт ыдолвта дытвдоытв тыдов та"
        detailInfo.numberOfLines = 0
        detailInfo.textAlignment = .left
        detailInfo.font = .systemFont(ofSize: 13, weight: .regular)
        productInfoStackView.addArrangedSubview(detailInfo)
        
        price.text = "Цена: \(productModel?.price ?? 0)р"
        price.textAlignment = .left
        price.font = .systemFont(ofSize: 15, weight: .bold)
        productInfoStackView.addArrangedSubview(price)
    }
    
    private func createTableComments() {
        contentStackView.addArrangedSubview(commentTable)
        commentTable.delegate = self
        commentTable.dataSource = self
        commentTable.register(CommentCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func createViewForHeader() -> UIView {
        let headerView = UIView()
        let label = UILabel()
        headerView.addSubview(label)
        label.text = "Отзывы"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .white
        return headerView
    }
}

// MARK: Class for tableview(get full contentSize)

open class IntrinsicTableView: UITableView {
    override public var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override public var intrinsicContentSize: CGSize {
        contentSize
    }
}

// MARK: UITableViewDelegate

extension ProductViewController: UITableViewDelegate {
    
}

// MARK: UITableViewDataSource

extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = commentTable.dequeueReusableCell(withIdentifier: "cell") as? CommentCell else { return UITableViewCell()
        }
        let comment = Comment(
            image: UIImage(named: "man") ?? UIImage(),
            nameAuthor: "ВЛда пуцыкосич",
            date: "10.08.2010",
            grade: "5★",
            commentText: "Все круто",
            detailComment: "Заказал бысто доставили крутой магаз"
        )
        cell.congif(comment: comment)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return createViewForHeader()
    }
}

