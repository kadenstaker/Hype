//
//  EnergyBillViewController.swift
//  Hype
//
//  Created by Hannah Hoff on 5/7/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class EnergyBillViewController: UIViewController {
    
    var habits: TrackableHabit? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var selectDateTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(EnergyBillViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(EnergyBillViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        selectDateTextField.inputView = datePicker
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        
        guard let usage = usageTextField.text,
            let amount = amountTextField.text,
            let date = selectDateTextField.text,
            !usage.isEmpty,
            !amount.isEmpty,
            !date.isEmpty else { return }
        TrackableHabitController.shared.createTrackableHabit(date: date, usage: usage, amount: amount)
        //save data to the bar chart somehow
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func updateViews() {
        usageTextField.text = "\(habits?.usage ?? "KWh")"
        amountTextField.text = "\(habits?.amount ?? "$000.00")" 
        
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/yyyy"
        
        selectDateTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
}
