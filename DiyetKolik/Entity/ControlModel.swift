//
//  ControlModel.swift
//  DiyetKolik
//
//  Created by Mehmet Ali Kılıçlı on 5.12.2022.
//

import Foundation

struct ControlModel  {
    var firstCurrency : String = "USD"
    var secondCurrency : String = "USD"
    
    var firstAmount : Double = 1.0
    var secondAmount : Double = 1.0

    init(firstCurrency: String = "USD", secondCurrency: String = "USD", firstAmount: Double = 1.0, secondAmount: Double = 1.0) {
        self.firstCurrency = firstCurrency
        self.secondCurrency = secondCurrency
        self.firstAmount = firstAmount
        self.secondAmount = secondAmount
    }
}
