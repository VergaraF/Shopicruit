//
//  Product.swift
//  Shopicruit
//
//  Created by Fabian Vergara on 2016-08-19.
//  Copyright © 2016 fvergara. All rights reserved.
//

import Foundation

class Product{
    var productName:  String
    var productPrice: Double
    var productType:  String
    
    init(name: String, price: Double, type: String){
        self.productName   = name
        self.productPrice = price
        self.productType  = type
    }
    
    func setPrice(price: Double){
        self.productPrice = price
    }
}
