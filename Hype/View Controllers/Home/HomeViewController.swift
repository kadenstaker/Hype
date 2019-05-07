//
//  HomeViewController.swift
//  Hype
//
//  Created by Kaden Staker on 4/25/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var homeNavigationItem: UINavigationItem!
    @IBOutlet weak var scoreCountLabel: UILabel!
    @IBOutlet weak var hypePointsLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var challengesSegmentedControl: UISegmentedControl!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    
    // MARK: - Properties
    
    let challenges = ["Challenge 1", "Challenge 2", "Challenge 3"]
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = tableView.frame.height / 3
        
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    // MARK: - Methods
    
    func updateViews() {
        updateScoreLabel()
        setUpStatusButton()
        setUpProfileButton()
        setUpCellSelection()
        setUpBackgroundView()
    }
    
    func setUpCellSelection() {
        tableView.allowsSelection = false
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func setUpProfileButton() {
        guard let button = profileButton else { return }
        button.layer.cornerRadius = 24
    }

    func setUpStatusButton() {
        guard let button = statsButton else { return }
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func setUpBackgroundView() {
        guard let layer = backgroundView else { return }

        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: 375, height: 304)
        gradient.colors = [
            UIColor(red:0, green:0.63, blue:0.29, alpha:1).cgColor,
            UIColor(red:0.32, green:0.81, blue:0.75, alpha:1).cgColor
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        layer.layer.addSublayer(gradient)
    }

    
    // increase, save, and update score
    func updateScoreLabel() {
        // define a constant string name for the key where the score will be stored
        let scoreKey = "scoreKey"
        // even if the key's value isn't Bool, iOS will return 'false'
        // if the key hasn't been set, yet, then set an initial value
        let scoreKeyExists: Bool = UserDefaults.standard.bool(forKey: scoreKey)
        if !scoreKeyExists {
            UserDefaults.standard.set(0, forKey: scoreKey)
            UserDefaults.standard.synchronize()
        }
        // retrieve the value when needed
        let currentScore = UserDefaults.standard.integer(forKey: scoreKey)
        // set value as needed
        let newScore = 10
        UserDefaults.standard.set(newScore, forKey: scoreKey)
        UserDefaults.standard.synchronize()
        
        self.scoreCountLabel.text = "\(currentScore)"
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return challenges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "challengeCell", for: indexPath) as? ChallengeTableViewCell
        let challenge = challenges[indexPath.row]
        cell?.challengeLabel.text = challenge
        cell?.challengeCompleteButton.backgroundColor = .lightGray
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
