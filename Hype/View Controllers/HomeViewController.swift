//
//  HomeViewController.swift
//  Hype
//
//  Created by Kaden Staker on 4/25/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    //landing pad
    var landingPad: MockData? {
        didSet {
            updateMock()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func updateNameLabel() {
        self.nameLabel.text = "\(UserController.shared.currentUser)"
    }
    
    func updateScoreLabel() {
//        self.scoreLabel.text = UserController.shared.
    }
    
    func updateViews() {
        updateNameLabel()
    }
    
    let challenges = ["Challenge 1", "Challenge 2", "Challenge 3"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return challenges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "challengeCell", for: indexPath) as? ChallengeTableViewCell
        let challenge = challenges[indexPath.row]
        cell?.challengeLabel.text = challenge
        cell?.challengeButton.backgroundColor = .lightGray
        let view = cell?.contentView.subviews[0]
        
        cell?.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        view?.layer.cornerRadius = 4
        view?.layer.shadowColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1).cgColor
        view?.layer.shadowOffset = CGSize(width: 0, height: 1)
        view?.layer.shadowOpacity = 0.1
        view?.layer.shadowRadius = 5.0
        cell?.contentView.layer.masksToBounds = true
        
//        return cell
        
        return cell ?? UITableViewCell()
    }
    
 
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

}

extension HomeViewController {
    
    func updateMock() {
//        guard let unwrapped = landingPad else { return }
//        nameLabel.text = "John Doe"
//        scoreLabel.text = "\(5)"
//
    }
}
