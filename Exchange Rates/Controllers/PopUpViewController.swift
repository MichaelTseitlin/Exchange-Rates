//
//  PopUpViewController.swift
//  Exchange Rates
//
//  Created by Michael Tseitlin on 7/12/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

protocol HelperProtocol {
    func setDateString(dateString: String)
}

class PopUpViewController: UIViewController {
    
    // MARK: - Properties
    
    var date: String! {
        didSet {
            if date.isEmpty {
                date = Date().fortmateToString()
            }
        }
    }
    var helper: HelperProtocol?
    var sender: Any?
    
    // MARK: - @IBOutlets
    
    @IBOutlet var datePicker: UIDatePicker!
    
    // MARK: - UIViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        datePicker.maximumDate = midnightToday
        datePicker.setDate(from: date)
        
        preferredContentSize = CGSize(width: datePicker.frame.width, height: datePicker.frame.height)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        setDefaultColorOfButton()
        helper?.setDateString(dateString: date)
    }
    
    // MARK: - Custom Methods
    
    private func updateDateViews() {
        date = datePicker.date.fortmateToString()
    }
    
    func setDefaultColorOfButton() {
        let button = sender as? UIButton
        button?.setImage(UIImage(named: "calendar"), for: .normal)
    }
    
    // MARK: - @IBActions
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
}
