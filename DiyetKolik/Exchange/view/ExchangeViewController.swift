//
//  ExchangeViewController.swift
//  DiyetKolik
//
//  Created by Mehmet Ali Kılıçlı on 1.12.2022.
//

import UIKit

class ExchangeViewController: UIViewController {
    
    @IBOutlet weak var firstCurrencyButton: UIButton!
    @IBOutlet weak var secondCurrencyButton: UIButton!
    
    @IBOutlet weak var exchangeTextField: UITextField!
    @IBOutlet weak var defaultExchangeLabel: UILabel!
    
    var exchangePresenterObject : ViewToPresenterExchangeProtocol?
    
    var currenciesDictionary = [String : Double]()
    var sortedCurrenciesKeys = [String]()
    
    var currenciesOnButtonFirstList = [UIAction]()
    var currenciesOnButtonSecondList = [UIAction]()
    var firstSelectedCurrency : String = "USD"
    var secondSelectedCurrency : String = "USD"
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ExchangeRouter.createModule(ref: self)
        exchangePresenterObject?.getSortedCurrenciesKeysList()
        setPullDownButtons()
        getCurrenciesDictionary()
        setDefaultExchangeLabel()
    }
    
    func setDefaultExchangeLabel() {
        defaultExchangeLabel.text = "1 USD = \(currenciesDictionary["EUR"]!) EUR"
    }
    
    func getCurrenciesDictionary() {
        let defaults = UserDefaults.standard
        self.currenciesDictionary = (defaults.value(forKey: "currenciesDictionary") as? [String : Double])!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toControlPage" {
                let gidilecekVC = segue.destination as! ControlViewController
            
        // Tamamını bir model olarak dönmem lazım
            //Model olarak oluşturdum
            gidilecekVC.firstSelectedCurrency = firstSelectedCurrency
            gidilecekVC.secondSelectedCurrency = secondSelectedCurrency
            gidilecekVC.firstCurrencyAmount = Double(exchangeTextField.text!)!
            gidilecekVC.secondCurrencyAmount = getExchangeAmount()
        }
    }
    
    
    @IBAction func exchangeButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "CONFIRM OPERATION", message: "Are you about to get \(exchangeTextField.text!) \(firstSelectedCurrency) for \(secondSelectedCurrency) \(getExchangeAmount()) ? Do you approve the transaction?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let confirmAction = UIAlertAction(title: "Confirm", style: .destructive){ action in
                    
            self.performSegue(withIdentifier: "toControlPage", sender: nil)
                
            }
            alert.addAction(confirmAction)
            
            self.present(alert, animated: true)
    }
    
    func getExchangeAmount() -> Double{
        var exchangeAmount =  Double(currenciesDictionary[secondSelectedCurrency]!) / Double(currenciesDictionary[firstSelectedCurrency]!) * Double(exchangeTextField.text!)!
        
        return Double(round(1000 * exchangeAmount) / 1000)

    }
}
//Setup UI
extension ExchangeViewController {
    func setPullDownButtons() {
        let firstButtonTapped = {(action: UIAction) in
            self.firstCurrencyButton.setTitle(action.title, for: .normal)
            self.firstSelectedCurrency = action.title
        }
        
        for currency in self.sortedCurrenciesKeys {
            currenciesOnButtonFirstList.append(UIAction(title: currency, handler: firstButtonTapped))
        }
        
        self.firstCurrencyButton.menu = UIMenu(children: currenciesOnButtonFirstList)
        
        let secondButtonTapped = {(action: UIAction) in
            self.secondCurrencyButton.setTitle(action.title, for: .normal)
            self.secondSelectedCurrency = action.title
        }
        
        for currency in self.sortedCurrenciesKeys {
            currenciesOnButtonSecondList.append(UIAction(title: currency, handler: secondButtonTapped))
        }
        self.secondCurrencyButton.menu = UIMenu(children: currenciesOnButtonSecondList)
    }
}

extension ExchangeViewController : PresenterToViewExchangeProtocol {
    func sendSortedCurrenciesKeysListToPresenter(sortedCurrenciesKeysList: [String]) {
        self.sortedCurrenciesKeys = sortedCurrenciesKeysList
    }
}
