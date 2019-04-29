//
//  HabitsTableViewController.swift
//  Hype
//
//  Created by Kaden Staker on 4/26/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class HabitsTableViewController: UITableViewController {
    
    @IBOutlet weak var habitNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Habits
    let habits = ["Transportation", "Recycle", "Energy", "Water"]
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return habits.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath) as? HabitTableViewCell
        let habit = habits[indexPath.row]
        cell?.habitLabel?.text = habit
        cell?.habitImageView.layer.cornerRadius = 40
        cell?.habitImageView.backgroundColor = .lightGray
        
        let view = cell?.contentView.subviews[0]
        cell?.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        view?.layer.cornerRadius = 4
        view?.layer.shadowColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1).cgColor
        view?.layer.shadowOffset = CGSize(width: 0, height: 1)
        view?.layer.shadowOpacity = 0.1
        view?.layer.shadowRadius = 5.0
        cell?.contentView.layer.masksToBounds = true
        
        return cell ?? UITableViewCell()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
  

}
