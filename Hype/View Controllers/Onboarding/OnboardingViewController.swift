//
//  OnboardingViewController.swift
//  Hype
//
//  Created by Kaden Staker on 5/3/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, OnboardingPageViewControllerDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton! {
        didSet{
            nextButton.layer.cornerRadius = 10
            nextButton.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var skipButton: UIButton!
    
    // MARK: - Properties
    var onboardingPageViewController: OnboardingPageViewController?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "hasViewedOnboarding") {
            return
        }
    }
    
    // MARK: - Actions
    @IBAction func skipButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "hasViewedOnboarding")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        if let index = onboardingPageViewController?.currentIndex {
            switch index {
            case 0...1:
                onboardingPageViewController?.forwardPage()
            case 2:
                UserDefaults.standard.set(true, forKey: "hasViewedOnboarding")
                dismiss(animated: true, completion: nil)
            default: break
            }
        }
        updateUI()
    }
    
    func updateUI() {
        if let index = onboardingPageViewController?.currentIndex {
            switch index {
            case 0...1:
                nextButton.setTitle("Next", for: .normal)
                nextButton.isHidden = false
                nextButton.setTitleColor(#colorLiteral(red: 0.003846419277, green: 0.6302518845, blue: 0.286464572, alpha: 1), for: .normal)
                nextButton.backgroundColor = UIColor.white
                skipButton.isHidden = false
                pageControl.isHidden = false
            case 2:
                nextButton.setTitle("Get Started", for: .normal)
                nextButton.setTitleColor(UIColor.white, for: .normal)
                nextButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
                nextButton.backgroundColor = #colorLiteral(red: 0.003846419277, green: 0.6302518845, blue: 0.286464572, alpha: 1)
                skipButton.isHidden = true
                pageControl.isHidden = true
            default: break
            }
            pageControl.currentPage = index
        }
    }
    
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? OnboardingPageViewController {
            onboardingPageViewController = pageViewController
            onboardingPageViewController?.onboardingDelegate = self
        }
    }
}
