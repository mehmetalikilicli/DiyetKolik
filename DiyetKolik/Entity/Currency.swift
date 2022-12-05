//
//  Currency.swift
//  DiyetKolik
//
//  Created by Mehmet Ali Kılıçlı on 1.12.2022.
//

import Foundation

struct CurrencyResult : Codable {
    var result : String?
    var base_code : String?
    var conversion_rates : Currency?
}

struct Currency : Codable {
    var USD : Double?
    var EUR : Double?
    var TRY : Double?
    var AFN : Double?
    var GEL : Double?
    var LYD : Double?
    var XCD : Double?
}
