//
//  CommentCell.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 7.02.22.
//

import UIKit

class CommentCell: UITableViewCell {

    var image = UIImageView()
    var nameAuthor =  UILabel()
    var date = UILabel()
    var grade = UILabel()
    var comment = UILabel()
    var detailComment = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createImage()
        createNameAuthor()
        createDate()
        createGrade()
        createComment()
        createDetailComment()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createImage() {
        addSubview(image)
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            image.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            image.widthAnchor.constraint(equalToConstant: 50),
            image.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func createNameAuthor() {
        addSubview(nameAuthor)
        nameAuthor.font = .systemFont(ofSize: 15, weight: .bold)
        nameAuthor.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            nameAuthor.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameAuthor.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func createDate() {
        addSubview(date)
        date.font = .systemFont(ofSize: 10, weight: .regular)
        date.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            date.topAnchor.constraint(equalTo: nameAuthor.bottomAnchor, constant: 5),
            date.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func createGrade() {
        addSubview(grade)
        grade.font = .systemFont(ofSize: 20, weight: .regular)
        grade.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            grade.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            grade.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func createComment() {
        addSubview(comment)
        comment.font = .systemFont(ofSize: 20, weight: .bold)
        comment.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            comment.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            comment.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func createDetailComment() {
        addSubview(detailComment)
        detailComment.font = .systemFont(ofSize: 13, weight: .regular)
        detailComment.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            detailComment.topAnchor.constraint(equalTo: comment.bottomAnchor, constant: 15),
            detailComment.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            detailComment.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            detailComment.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}
