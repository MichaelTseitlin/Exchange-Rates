//
//  Extension+UIDatePicker.swift
//  Exchange Rates
//
//  Created by Michael Tseitlin on 7/14/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

extension UIDatePicker {
    
    func setDate(from string: String, animated: Bool = true) {
        
        let formater = DateFormatter()
        
        formater.dateFormat = "dd.MM.yyyy"
        
        let date = formater.date(from: string) ?? Date()
        
        setDate(date, animated: animated)
    }
}
