//
//  CurrencyRouter.swift
//  DiyetKolik
//
//  Created by Mehmet Ali Kılıçlı on 1.12.2022.
//

import Foundation

class CurrencyRouter : PresenterToRouterCurrencyProtocol {
    static func createModule(ref: CurrencyViewController) {
        
        let presenter = CurrencyPresenter()
        
        ref.currencyPresenterObject = presenter
        
        ref.currencyPresenterObject?.currencyInteractor = CurrencyInteractor()
        ref.currencyPresenterObject?.currencyView = ref
        
        ref.currencyPresenterObject?.currencyInteractor?.currencyPresenter = presenter
        
    }
}
