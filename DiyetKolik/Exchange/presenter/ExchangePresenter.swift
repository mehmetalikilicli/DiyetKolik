//
//  ExchangePresenter.swift
//  DiyetKolik
//
//  Created by Mehmet Ali Kılıçlı on 1.12.2022.
//

import Foundation

class ExchangePresenter : ViewToPresenterExchangeProtocol{
    func getCurrenciesDictionary() {
        exchangeInteractor?.getCurrenciesDictionary()
    }
    
    var exchangeInteractor: PresenterToInteractorExchangeProtocol?
    
    var exchangeView: PresenterToViewExchangeProtocol?
    
    func getSortedCurrenciesKeysList() {
        exchangeInteractor?.getSortedCurrenciesKeysList()
    }
    
}

extension ExchangePresenter : InteractorToPresenterExchangeProtocol {
    func sendCurrenciesDictToPresenter(currenciesDictionary: [String : Double]) {
        exchangeView?.sendCurrenciesDictToView(currenciesDictionary: currenciesDictionary)
    }
    
    func sendSortedCurrenciesKeysListToPresenter(sortedCurrenciesKeysList: [String]) {
        exchangeView?.sendSortedCurrenciesKeysListToPresenter(sortedCurrenciesKeysList: sortedCurrenciesKeysList)
    }
}
