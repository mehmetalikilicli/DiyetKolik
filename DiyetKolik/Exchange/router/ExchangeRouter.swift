//
//  ExchangeRouter.swift
//  DiyetKolik
//
//  Created by Mehmet Ali Kılıçlı on 1.12.2022.
//

import Foundation

class ExchangeRouter : PresenterToRouterExchangeProtocol{
    static func createModule(ref: ExchangeViewController) {
        let presenter = ExchangePresenter()
        
        ref.exchangePresenterObject = presenter
        
        ref.exchangePresenterObject?.exchangeInteractor = ExchangeInteractor()
        ref.exchangePresenterObject?.exchangeView = ref
        
        ref.exchangePresenterObject?.exchangeInteractor?.exchangePresenter = presenter
    }
    
}
