//
//  Exchange.swift
//  Exchange Rates
//
//  Created by Michael Tseitlin on 7/11/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

struct Exchange: Codable {
    
    let date: String
    let exchangeRate: [ExchangeRate]
}

struct ExchangeRate: Codable {
    
    let baseCurrency: String
    let currency: String?
    let saleRateNB: Double?
    let purchaseRateNB: Double
    let saleRate: Double?
    let purchaseRate: Double?
}
