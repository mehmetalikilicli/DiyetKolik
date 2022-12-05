//
//  ExchangeInteractor.swift
//  DiyetKolik
//
//  Created by Mehmet Ali Kılıçlı on 1.12.2022.
//

import Foundation

class ExchangeInteractor :PresenterToInteractorExchangeProtocol{
    var exchangePresenter: InteractorToPresenterExchangeProtocol?
    
    var currenciesDictionary = [String : Double]()
    var sortedCurrenciesKeys = [String]()
    
    func getSortedCurrenciesKeysList() {
        let defaults = UserDefaults.standard
        self.currenciesDictionary = (defaults.value(forKey: "currenciesDictionary") as? [String : Double])!
        
        //Currencies Dictionary'nin key'lerini alfabetik olarak sıralar ve
        //sortedCurrenciesKeys dizisine kaydeder.
        sortedCurrenciesKeys = Array(currenciesDictionary.keys).sorted(by: { currenciesDictionary[$0]! < currenciesDictionary[$1]! })
        
        exchangePresenter?.sendSortedCurrenciesKeysListToPresenter(sortedCurrenciesKeysList: sortedCurrenciesKeys)
    }
    
    
}
