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
    var currentDate : Date?
    
    func getCurrenciesDictionary() {
        
        
        currentDate = Date()

        let defaults = UserDefaults.standard
        UserDefaults.standard.synchronize()
        
        //Kullanici ilk girdiğinde çalışır
        if defaults.value(forKey: "lastRequestDate") == nil {
            
            let urlString = Urls.baseUrl

            guard let url = URL(string: urlString) else { return }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil, let data = data else { return }
                let answer = try? JSONDecoder().decode(CurrencyResult.self, from: data)
                
                let defaults = UserDefaults.standard
                UserDefaults.standard.synchronize()
                
                self.currenciesDictionary["USD"] = answer?.conversion_rates?.USD!
                self.currenciesDictionary["EUR"] = answer?.conversion_rates?.EUR!
                self.currenciesDictionary["TRY"] = answer?.conversion_rates?.TRY!
                self.currenciesDictionary["AFN"] = answer?.conversion_rates?.AFN!
                self.currenciesDictionary["GEL"] = answer?.conversion_rates?.GEL!
                self.currenciesDictionary["LYD"] = answer?.conversion_rates?.LYD!
                self.currenciesDictionary["XCD"] = answer?.conversion_rates?.XCD!
                
                defaults.set(self.currenciesDictionary, forKey: "currenciesDictionary")
            }.resume()
            
            self.currenciesDictionary = (defaults.value(forKey: "currenciesDictionary") as? [String : Double])!
            currencyPresenter?.sendCurrenciesDictToPresenter(currenciesDictionary: currenciesDictionary)
            
            let defaults = UserDefaults.standard
            defaults.set(currentDate, forKey: "lastRequestDate")
        } else {
            let defaults = UserDefaults.standard
            let lastDate = defaults.value(forKey: "lastRequestDate") as! Date
            
            let diffDates = Calendar.current.dateComponents([.hour], from: lastDate , to: currentDate!)
            let hours = diffDates.hour
            
            if hours! >= 24 { //Kullanicinin diğer girişlerinde 24 saati geçmişse çalışır
                let urlString = Urls.baseUrl

                guard let url = URL(string: urlString) else { return }
                
                URLSession.shared.dataTask(with: url) { data, response, error in
                    guard error == nil, let data = data else { return }
                    let answer = try? JSONDecoder().decode(CurrencyResult.self, from: data)
                    
                    let defaults = UserDefaults.standard
                    UserDefaults.standard.synchronize()
                    
                    self.currenciesDictionary["USD"] = answer?.conversion_rates?.USD!
                    self.currenciesDictionary["EUR"] = answer?.conversion_rates?.EUR!
                    self.currenciesDictionary["TRY"] = answer?.conversion_rates?.TRY!
                    self.currenciesDictionary["AFN"] = answer?.conversion_rates?.AFN!
                    self.currenciesDictionary["GEL"] = answer?.conversion_rates?.GEL!
                    self.currenciesDictionary["LYD"] = answer?.conversion_rates?.LYD!
                    self.currenciesDictionary["XCD"] = answer?.conversion_rates?.XCD!
                    
                    defaults.set(self.currenciesDictionary, forKey: "currenciesDictionary")
                }.resume()
                
                self.currenciesDictionary = (defaults.value(forKey: "currenciesDictionary") as? [String : Double])!
                currencyPresenter?.sendCurrenciesDictToPresenter(currenciesDictionary: currenciesDictionary)
            } else { //Kullanıcının diğer girişlerinde çalışır
                self.currenciesDictionary = (defaults.value(forKey: "currenciesDictionary") as? [String : Double])!
                currencyPresenter?.sendCurrenciesDictToPresenter(currenciesDictionary: currenciesDictionary)
                print("Henüz 24 saat olmadığı için localdeki veriler kullanılıyor!")
            }
            
        }
    }
    
    func getSortedCurrenciesKeysList() {
        let defaults = UserDefaults.standard
        self.currenciesDictionary = (defaults.value(forKey: "currenciesDictionary") as? [String : Double])!
        
        //Currencies Dictionary'nin key'lerini alfabetik olarak sıralar ve
        //sortedCurrenciesKeys dizisine kaydeder.
        sortedCurrenciesKeys = Array(currenciesDictionary.keys).sorted(by: { currenciesDictionary[$0]! < currenciesDictionary[$1]! })
        
        currencyPresenter?.sendSortedCurrenciesKeysListToPresenter(sortedCurrenciesKeysList: sortedCurrenciesKeys)
    }   
}
