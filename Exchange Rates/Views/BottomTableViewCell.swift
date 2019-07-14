//
//  BottomTableViewCell.swift
//  Exchange Rates
//
//  Created by Michael Tseitlin on 7/12/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

class BottomTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlets
    
    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var saleRateNBLabel: UILabel!
    @IBOutlet var currencyAmountLabel: UILabel!
    
    // MARK: - Custom Methods
    
    func config(exchangeRate: ExchangeRate?) {
        currencyLabel.text = exchangeRate?.currency?.getCurrencyFullName()
        saleRateNBLabel.text = String(format: "%.2f",exchangeRate?.saleRateNB ?? 0) + " UAH"
        
        if let currency = exchangeRate?.currency {
            currencyAmountLabel.text = "1 " + currency
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            contentView.backgroundColor = #colorLiteral(red: 0.4222621918, green: 0.5897040367, blue: 0.5367286205, alpha: 1)
            currencyLabel.textColor = .white
            saleRateNBLabel.textColor = .white
            currencyAmountLabel.textColor = .white
        } else {
            contentView.backgroundColor = .white
            currencyLabel.textColor = .black
            saleRateNBLabel.textColor = .black
            currencyAmountLabel.textColor = #colorLiteral(red: 0.4222621918, green: 0.5897040367, blue: 0.5367286205, alpha: 1)
        }
    }
}
