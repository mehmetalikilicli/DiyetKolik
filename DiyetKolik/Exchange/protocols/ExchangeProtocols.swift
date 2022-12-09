//
//  ExchangeProtocols.swift
//  DiyetKolik
//
//  Created by Mehmet Ali Kılıçlı on 1.12.2022.
//

import Foundation

protocol ViewToPresenterExchangeProtocol {
    var exchangeInteractor : PresenterToInteractorExchangeProtocol? {get set}
    var exchangeView : PresenterToViewExchangeProtocol? {get set}
    
    func getCurrenciesDictionary()
    func getSortedCurrenciesKeysList()
}

protocol PresenterToInteractorExchangeProtocol {
    var exchangePresenter : InteractorToPresenterExchangeProtocol? {get set}
    
    func getCurrenciesDictionary()
    func getSortedCurrenciesKeysList()
}

protocol InteractorToPresenterExchangeProtocol {
    func sendCurrenciesDictToPresenter(currenciesDictionary : [String : Double])
    func sendSortedCurrenciesKeysListToPresenter(sortedCurrenciesKeysList: [String])
}

protocol PresenterToViewExchangeProtocol {
    
    func sendCurrenciesDictToView(currenciesDictionary : [String : Double])
    func sendSortedCurrenciesKeysListToPresenter(sortedCurrenciesKeysList: [String])
}
protocol PresenterToRouterExchangeProtocol {
    static func createModule(ref: ExchangeViewController)
}
