//
//  CurrencyInteractor.swift
//  DiyetKolik
//
//  Created by Mehmet Ali Kılıçlı on 1.12.2022.
//

import Foundation

class CurrencyInteractor : PresenterToInteractorCurrencyProtocol {
    var currencyPresenter: InteractorToPresenterCurrencyProtocol?
    
    var currenciesDictionary = [String : Double]()
    var sortedCurrenciesKeys = [String]()
    
    func getCurrenciesDictionary() {
        
        let urlString = Urls.baseUrl
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard error == nil, let data = data else { return }
            let answer = try? JSONDecoder().decode(CurrencyResult.self, from: data)
            //print(answer)
            
            self.currenciesDictionary["USD"] = answer?.conversion_rates?.USD!
            self.currenciesDictionary["EUR"] = answer?.conversion_rates?.EUR!
            self.currenciesDictionary["TRY"] = answer?.conversion_rates?.TRY!
            self.currenciesDictionary["AFN"] = answer?.conversion_rates?.AFN!
            self.currenciesDictionary["GEL"] = answer?.conversion_rates?.GEL!
            self.currenciesDictionary["LYD"] = answer?.conversion_rates?.LYD!
            self.currenciesDictionary["XCD"] = answer?.conversion_rates?.XCD!
            
            self.currencyPresenter?.sendCurrenciesDictToPresenter(currenciesDictionary: self.currenciesDictionary)

            
        }.resume()
        
        //print(currenciesDictionary)
        

    }
    
    func getSortedCurrenciesKeysList() {
        //print(currenciesDictionary)

        sortedCurrenciesKeys = Array(currenciesDictionary.keys).sorted(by: { currenciesDictionary[$0]! < currenciesDictionary[$1]! })
        
        currencyPresenter?.sendSortedCurrenciesKeysListToPresenter(sortedCurrenciesKeysList: sortedCurrenciesKeys)
    }
}
