//
//  WeeklyViewController.swift
//  Hype
//
//  Created by Kaden Staker on 5/7/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class WeeklyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var challenges = ["Create a compost bin"]
    
    @IBOutlet weak var weeklyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weeklyTableView.dataSource = self
        weeklyTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return challenges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weeklyChallengeCell", for: indexPath) as? WeeklyChallengeTableViewCell
        let challenge = challenges[indexPath.row]
        cell?.challengeNameLabel.text = challenge
        cell?.completeButton.backgroundColor = #colorLiteral(red: 0, green: 0.6532471776, blue: 0.4756888151, alpha: 1)
        let view = cell?.contentView.subviews[0]
        
        cell?.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        view?.layer.cornerRadius = 4
        view?.layer.shadowColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1).cgColor
        view?.layer.shadowOffset = CGSize(width: 0, height: 1)
        view?.layer.shadowOpacity = 0.1
        view?.layer.shadowRadius = 5.0
        cell?.contentView.layer.masksToBounds = true
        
        cell?.selectionStyle = .none
        
        return cell ?? UITableViewCell()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
