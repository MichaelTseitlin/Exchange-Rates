//
//  Extension+String.swift
//  Exchange Rates
//
//  Created by Michael Tseitlin on 7/12/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import Foundation

extension String {
    
    func getCurrencyFullName() -> String? {
        return Locale.current.localizedString(forCurrencyCode: self)?.capitalized
    }
}
