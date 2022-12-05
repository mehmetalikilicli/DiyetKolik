//
//  CurrencyProtocols.swift
//  DiyetKolik
//
//  Created by Mehmet Ali Kılıçlı on 1.12.2022.
//

import Foundation

protocol ViewToPresenterCurrencyProtocol {
    
    var currencyInteractor : PresenterToInteractorCurrencyProtocol? {get set}
    var currencyView : PresenterToViewCurrencyProtocol? {get set}
    
    func getCurrenciesDictionary()
    func getSortedCurrenciesKeysList()
    
}

protocol PresenterToInteractorCurrencyProtocol {
    var currencyPresenter : InteractorToPresenterCurrencyProtocol? {get set}
    
    func getCurrenciesDictionary()
    func getSortedCurrenciesKeysList()
    
}

protocol InteractorToPresenterCurrencyProtocol {
    func sendCurrenciesDictToPresenter(currenciesDictionary : [String : Double])
    func sendSortedCurrenciesKeysListToPresenter(sortedCurrenciesKeysList: [String])
}

protocol PresenterToViewCurrencyProtocol {
    func sendCurrenciesDictToView(currenciesDictionary : [String : Double])
    func sendSortedCurrenciesKeysListToView(sortedCurrenciesKeysList: [String])

}

protocol PresenterToRouterCurrencyProtocol {
    static func createModule(ref: CurrencyViewController)
}
