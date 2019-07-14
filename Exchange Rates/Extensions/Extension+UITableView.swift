//
//  Extension+UITableView.swift
//  Exchange Rates
//
//  Created by Michael Tseitlin on 7/12/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

extension UITableView {

    func deselectAllRows(animated: Bool = true) {
        guard let selectedItems = indexPathsForSelectedRows else { return }
        selectedItems.forEach({ deselectRow(at: $0, animated: animated)})
    }
}
