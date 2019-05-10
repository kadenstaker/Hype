//
//  AddBillViewController.swift
//  Hype
//
//  Created by Hannah Hoff on 5/10/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class AddBillViewController: UIViewController {
    
    var input: Double!
    
    @IBOutlet weak var selectDateTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
//    var selectDateTextField: UITextField!
//    var usageTextField: UITextField!
//    var amountTextField: UITextField!
//    var saveButton: UIButton!
    
    private var datePicker: UIDatePicker?
    
    var habits: TrackableHabit? {
        didSet {
            updateViews()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(AddBillViewController.dateChanged(datePicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddBillViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        selectDateTextField.inputView = datePicker
    }
    
    @objc func saveButtonTapped(_ sender: UIButton) {
        saveButton.addTarget(self, action: #selector(self.saveButtonTapped(_:)), for: .touchUpInside)
        
        guard let tempInput = Double(usageTextField.text!),
        let amountTextField = amountTextField.text,
            let selectDateTextField = selectDateTextField.text,
        let usageTextField = usageTextField.text else { return }
        TrackableHabitController.shared.createTrackableHabit(date: selectDateTextField, usage: usageTextField, amount: amountTextField)
        
        input = tempInput
        
        performSegue(withIdentifier: "unwindWithData", sender: self)
    }
    
    func updateViews() {
        usageTextField.text = habits?.usage
        amountTextField.text = habits?.amount
        selectDateTextField.text = habits?.date
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
