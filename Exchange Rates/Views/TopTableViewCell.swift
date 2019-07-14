//
//  TopTableViewCell.swift
//  Exchange Rates
//
//  Created by Michael Tseitlin on 7/12/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

class TopTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlets
    
    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var saleRateLabel: UILabel!
    @IBOutlet var purchaseRateLabel: UILabel!
    
    // MARK: - Custom Methods
    
    func config(exchangeRate: ExchangeRate?) {
        currencyLabel.text = exchangeRate?.currency
        saleRateLabel.text = String(format: "%.3f",exchangeRate?.saleRate ?? 0)
        purchaseRateLabel.text = String(format: "%.3f",exchangeRate?.purchaseRate ?? 0)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            contentView.backgroundColor = #colorLiteral(red: 0.4235294118, green: 0.5882352941, blue: 0.537254902, alpha: 1)
            currencyLabel.textColor = .white
            saleRateLabel.textColor = .white
            purchaseRateLabel.textColor = .white
        } else {
            contentView.backgroundColor = .white
            currencyLabel.textColor = .black
            saleRateLabel.textColor = .black
            purchaseRateLabel.textColor = .black
        }
    }
}
