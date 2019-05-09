//
//  WeeklyDetailTableViewController.swift
//  Hype
//
//  Created by Kaden Staker on 5/8/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class WeeklyDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var challengeImageView: UIImageView!
    @IBOutlet weak var challengeLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var acceptButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func acceptButtonTapped(_ sender: Any) {
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weeklyDetailChallengeCell", for: indexPath)
        
        
        
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
