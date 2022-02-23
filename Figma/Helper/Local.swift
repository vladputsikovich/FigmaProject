//
//  Product.swift
//  Lesson22
//
//  Created by Владислав Пуцыкович on 16.01.22.
//

import Foundation
import UIKit
import CoreLocation

struct Advert {
    var image: UIImage
}

struct Product {
    var name: String
    var price: Float
    var image: UIImage
}

struct Shop {
    var latitude: Double
    var longitude: Double
    var name: String
    var phoneNumber: String
}

class Menu {
    var products = [Product]()
    var adverts = [Advert]()
    
    init() {
        setup()
    }
    
    func setup() {
        let p1 = Product(
            name: "Майка Крутая",
            price: 20.4,
            image: UIImage(named: "mac") ?? .init()
        )
        let p2 = Product(
            name: "Кофта крутая",
            price: 27.5,
            image: UIImage(named: "mac") ?? .init()
        )
        let p3 = Product(
            name: "Майка так себе",
            price: 40,
            image: UIImage(named: "mac") ?? .init()
        )
        let p4 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "mac") ?? .init()
        )
        let p5 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "mac") ?? .init()
        )
        let p6 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "mac") ?? .init()
        )
        let p7 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "mac") ?? .init()
        )
        let p8 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "mac") ?? .init()
        )
        let p9 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "mac") ?? .init()
        )
        let p10 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "mac") ?? .init()
        )
        let p11 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "mac") ?? .init()
        )
        let p12 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "mac") ?? .init()
        )
        let p13 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "mac") ?? .init()
        )
        
        let advertTop1 = Advert(image: UIImage(named: "advert1") ?? .init())
        let advertTop2 = Advert(image: UIImage(named: "advert2") ?? .init())
        
        products = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13]
        adverts = [advertTop1, advertTop2]
    }
}

class Shops {
    var shops = [
        Shop(latitude: 20, longitude: 20, name: "sdf", phoneNumber: "sdfsdf"),
        Shop(latitude: 20, longitude: 21, name: "sdf", phoneNumber: "sdfsdf"),
        Shop(latitude: 20, longitude: 22, name: "sdf", phoneNumber: "sdfsdf"),
        Shop(latitude: 20, longitude: 23, name: "sdf", phoneNumber: "sdfsdf")
    ]
}
