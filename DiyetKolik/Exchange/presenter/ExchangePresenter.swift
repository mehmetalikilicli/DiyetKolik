//
//  ExchangePresenter.swift
//  DiyetKolik
//
//  Created by Mehmet Ali Kılıçlı on 1.12.2022.
//

import Foundation

class ExchangePresenter : ViewToPresenterExchangeProtocol{
    var exchangeInteractor: PresenterToInteractorExchangeProtocol?
    
    var exchangeView: PresenterToViewExchangeProtocol?
    
    func getSortedCurrenciesKeysList() {
        exchangeInteractor?.getSortedCurrenciesKeysList()
    }
    
}

extension ExchangePresenter : InteractorToPresenterExchangeProtocol {
    func sendSortedCurrenciesKeysListToPresenter(sortedCurrenciesKeysList: [String]) {
        exchangeView?.sendSortedCurrenciesKeysListToPresenter(sortedCurrenciesKeysList: sortedCurrenciesKeysList)
    }
}
