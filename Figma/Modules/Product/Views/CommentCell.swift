//
//  CommentCell.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 7.02.22.
//

import UIKit

// MARK: Comment struct

struct Comment {
    var image: UIImage
    var nameAuthor: String
    var date: String
    var grade: String
    var commentText: String
    var detailComment: String
}

class CommentCell: UITableViewCell {

    // MARK: Properties
    
    private let image = UIImageView()
    private let nameAuthor =  UILabel()
    private let date = UILabel()
    private let grade = UILabel()
    private let commentText = UILabel()
    private let detailComment = UILabel()
    
    // MARK: Init
    
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
    
    // MARK: Func for create Ui elements
    
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
        addSubview(commentText)
        commentText.font = .systemFont(ofSize: 20, weight: .bold)
        commentText.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            commentText.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            commentText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func createDetailComment() {
        addSubview(detailComment)
        detailComment.font = .systemFont(ofSize: 13, weight: .regular)
        detailComment.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            detailComment.topAnchor.constraint(equalTo: commentText.bottomAnchor, constant: 15),
            detailComment.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            detailComment.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            detailComment.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

    // MARK: Config
    
    func congif(comment: Comment) {
        image.image = comment.image
        nameAuthor.text = comment.nameAuthor
        date.text = comment.date
        grade.text = comment.grade
        commentText.text = comment.commentText
        detailComment.text = comment.detailComment
    }
}
