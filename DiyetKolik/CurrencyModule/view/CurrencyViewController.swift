//
//  CurrencyViewController.swift
//  DiyetKolik
//
//  Created by Mehmet Ali Kılıçlı on 1.12.2022.
//

import UIKit

class CurrencyViewController: UIViewController {
    
    @IBOutlet weak var currenciesTableView: UITableView!
    
    var currencyPresenterObject : ViewToPresenterCurrencyProtocol?
    
    var currenciesDictionary = [String : Double]()
    var sortedCurrenciesKeys = [String]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currenciesTableView.delegate = self
        currenciesTableView.dataSource = self
    
        CurrencyRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        currencyPresenterObject?.getCurrenciesDictionary()
        currencyPresenterObject?.getSortedCurrenciesKeysList()
    }

}
extension CurrencyViewController : PresenterToViewCurrencyProtocol {
    func sendCurrenciesDictToView(currenciesDictionary: [String : Double]) {
        self.currenciesDictionary = currenciesDictionary
        DispatchQueue.main.async {
            self.currenciesTableView.reloadData()
        }
    }
    
    func sendSortedCurrenciesKeysListToView(sortedCurrenciesKeysList: [String]) {
        self.sortedCurrenciesKeys = sortedCurrenciesKeysList
        DispatchQueue.main.async {
            self.currenciesTableView.reloadData()
        }
    }
}

extension CurrencyViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedCurrenciesKeys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currency = currenciesDictionary[sortedCurrenciesKeys[indexPath.row]]
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell") as! CurrencyCell
        
        cell.CurrencyLabel.text = "\(sortedCurrenciesKeys[indexPath.row]) - \(currency!.description)"
        return cell
    }
}
