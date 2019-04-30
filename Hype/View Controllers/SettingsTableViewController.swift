//
//  SettingsTableViewController.swift
//  Hype
//
//  Created by Kaden Staker on 4/29/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Table view data source
   
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
