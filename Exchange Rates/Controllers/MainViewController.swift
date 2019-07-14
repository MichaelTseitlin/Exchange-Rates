//
//  MainViewController.swift
//  Exchange Rates
//
//  Created by Michael Tseitlin on 7/11/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, HelperProtocol {
    
    // MARK: - Properties
    
    var date = ""
    var exchange: Exchange?
    
    // MARK: - @IBOutlets
    
    @IBOutlet weak var topTableView: UITableView!
    @IBOutlet weak var bottomTableView: UITableView!
    @IBOutlet var topDateLabel: UILabel!
    @IBOutlet var bottomDateLabel: UILabel!
    @IBOutlet var indicator: UIActivityIndicatorView!

    
    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData(string: Date().fortmateToString())
    }

    // MARK: - Custom Methods
    
    func loadData(string: String) {
        
        updateUI(string: string)
        indicator.startAnimating()

        NetworkManager.shared.fetchData(dateString: string) { exchange in
            self.exchange = exchange
            
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
                self.topTableView.reloadData()
                self.bottomTableView.reloadData()
            }
        }
    }
    
    func updateUI(string: String) {
        topDateLabel.text = string
        bottomDateLabel.text = string
    }
    
    func setDateString(dateString: String) {
        date = dateString
        loadData(string: dateString)
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let topCell = exchange?.exchangeRate.filter({ $0.saleRate != nil })
        let bottomCell = exchange?.exchangeRate.filter({ $0.currency != nil })
        
        return tableView == topTableView ? topCell?.count ?? 0 : bottomCell?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableView {
        case topTableView:
            
            let filterExchange = exchange?.exchangeRate.filter({ $0.saleRate != nil })
            let exchangeRate = filterExchange?[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "topCell", for: indexPath) as! TopTableViewCell
            cell.config(exchangeRate: exchangeRate)
            
            return cell
            
        case bottomTableView:
            
            let filterExchange = exchange?.exchangeRate.filter({ $0.currency != nil })
            let exchangeRate = filterExchange?[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "bottomCell", for: indexPath) as! BottomTableViewCell
            cell.config(exchangeRate: exchangeRate)
            
            return cell
            
        default:
            break
        }
        
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let topFilterExchange = exchange?.exchangeRate.filter({ $0.saleRate != nil })
        let bottomFilterExchange = exchange?.exchangeRate.filter({ $0.currency != nil })
        
        switch tableView {
        case topTableView:
            
            let selectedItem = topFilterExchange?[indexPath.row].currency
            
            if let indexOfBottomArray = bottomFilterExchange?.firstIndex(where: { $0.currency == selectedItem}) {
                bottomTableView.scrollToRow(at: IndexPath(row: indexOfBottomArray, section: 0), at: .middle, animated: true)
                bottomTableView.selectRow(at: IndexPath(row: indexOfBottomArray, section: 0), animated: true, scrollPosition: .middle)
            }
            
        case bottomTableView:
            
            let selectedItem = bottomFilterExchange?[indexPath.row].currency
            
            if let indexOfTopArray = topFilterExchange?.firstIndex(where: { $0.currency == selectedItem}) {
                topTableView.scrollToRow(at: IndexPath(row: indexOfTopArray, section: 0), at: .middle, animated: true)
                topTableView.selectRow(at: IndexPath(row: indexOfTopArray, section: 0), animated: true, scrollPosition: .middle)
            } else {
                bottomTableView.deselectRow(at: indexPath, animated: true)
                topTableView.deselectAllRows(animated: true)
            }
            
        default:
            break
        }
    }
}

// MARK: - UIPopoverPresentationControllerDelegate

extension MainViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let popUpViewController = segue.destination.popoverPresentationController,
            let button = sender as? UIButton {
            button.setImage(UIImage(named: "calendar_selected"), for: .normal)
            popUpViewController.delegate = self
            popUpViewController.sourceRect = button.bounds
        }
        
        guard segue.identifier == "showDataPicker" else { return }
        
        let objectsViewController = segue.destination as! PopUpViewController
        objectsViewController.helper = self
        objectsViewController.sender = sender
        objectsViewController.date = date
    }
}


