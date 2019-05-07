//
//  HomeViewController.swift
//  Hype
//
//  Created by Kaden Staker on 4/25/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var homeNavigationItem: UINavigationItem!
    @IBOutlet weak var scoreCountLabel: UILabel!
    @IBOutlet weak var hypePointsLabel: UILabel!
    @IBOutlet weak var challengesSegmentedControl: UISegmentedControl!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var dailyContainerView: UIView!
    @IBOutlet weak var weeklyContainerView: UIView!
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = tableView.frame.height / 3
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        switch challengesSegmentedControl.selectedSegmentIndex {
        case 0:
            // Hide weekly tvc
            weeklyContainerView.isHidden = true
            dailyContainerView.isHidden = false
        case 1:
        // Hide daily tvc
            dailyContainerView.isHidden = true
            weeklyContainerView.isHidden = false
        default:
            break
        }
    }

    // MARK: - Methods
    func updateViews() {
        updateScoreLabel()
        setUpStatusButton()
        setUpProfileButton()
        setUpCellSelection()
        setDefaultSegment()
    }
    
    func setDefaultSegment() {
        let segmentedControl = challengesSegmentedControl
        segmentedControl?.selectedSegmentIndex = 0
    }
    
    func setUpCellSelection() {
//        tableView.allowsSelection = false
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
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
