//
//  EnergyBillViewController.swift
//  Hype
//
//  Created by Hannah Hoff on 5/7/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class EnergyBillViewController: UIViewController {
    
    var numbers: [Double] = []
    var input: Double!
    
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

        // get the input from the textField as a double
        guard let tempInput = Double(usageTextField.text!) else { return }
        
        input = tempInput
        // append the data to the entry
        performSegue(withIdentifier: "unwindWithData", sender: self)
        // update the graph
        // pop navigation controller
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
