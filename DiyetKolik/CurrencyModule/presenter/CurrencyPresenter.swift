//
//  CurrencyPresenter.swift
//  DiyetKolik
//
//  Created by Mehmet Ali Kılıçlı on 1.12.2022.
//

import Foundation

class CurrencyPresenter : ViewToPresenterCurrencyProtocol {
    var currencyInteractor: PresenterToInteractorCurrencyProtocol?
    var currencyView: PresenterToViewCurrencyProtocol?
    
    func getCurrenciesDictionary() {
        currencyInteractor?.getCurrenciesDictionary()
    }
    
    func getSortedCurrenciesKeysList() {
        currencyInteractor?.getSortedCurrenciesKeysList()
    }
    
}

extension CurrencyPresenter : InteractorToPresenterCurrencyProtocol {
    func sendCurrenciesDictToPresenter(currenciesDictionary: [String : Double]) {
        currencyView?.sendCurrenciesDictToView(currenciesDictionary: currenciesDictionary)
    }
    
    func sendSortedCurrenciesKeysListToPresenter(sortedCurrenciesKeysList: [String]) {
        currencyView?.sendSortedCurrenciesKeysListToView(sortedCurrenciesKeysList: sortedCurrenciesKeysList)
    }
    
}
