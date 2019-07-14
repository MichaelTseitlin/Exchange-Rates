//
//  Extension+Date.swift
//  Exchange Rates
//
//  Created by Michael Tseitlin on 7/12/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import Foundation

extension Date {
    
    func fortmateToString() -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        let stringDate = dateFormatter.string(from: self)
        
        if let date = dateFormatter.date(from: stringDate) {
            return dateFormatter.string(from: date)
        }
        return "--"
    }
}
