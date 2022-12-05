//
//  ControlViewController.swift
//  DiyetKolik
//
//  Created by Mehmet Ali Kılıçlı on 5.12.2022.
//

import UIKit

class ControlViewController: UIViewController {
    
    @IBOutlet weak var controlLabel: UILabel!
    
    
    var firstSelectedCurrency : String = "USD"
    var secondSelectedCurrency : String = "USD"
    
    var firstCurrencyAmount : Double = 1.0
    var secondCurrencyAmount : Double = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controlLabel.text = "\(firstCurrencyAmount) \(firstSelectedCurrency) = \(secondCurrencyAmount) \(secondSelectedCurrency)"
    
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: ExchangeViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
}
