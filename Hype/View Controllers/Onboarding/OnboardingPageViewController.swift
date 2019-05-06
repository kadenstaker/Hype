//
//  OnboardingPageViewController.swift
//  Hype
//
//  Created by Kaden Staker on 5/3/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

protocol OnboardingPageViewControllerDelegate: class {
    func didUpdatePageIndex(currentIndex: Int)
}

class OnboardingPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    // MARK: - Properties
    weak var onboardingDelegate: OnboardingPageViewControllerDelegate?
    
    var pageLabels = ["Fill a progress bar and check off daily challenges", "Try weekly challenges and complete them before time runs out", "Track your fuel, energy, and water usage"]
    var pageImages = [""]
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: Page view controller data source
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! OnboardingContentViewController).index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! OnboardingContentViewController).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    // MARK: - Helpers
    func contentViewController(at index: Int) -> OnboardingContentViewController? {
        if index < 0 || index >= pageLabels.count {
            return nil
        }
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "OnboardingContentViewController") as? OnboardingContentViewController {
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.text = pageLabels[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        return nil
    }
    
    func forwardPage() {
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: - Page view controller delegate
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? OnboardingContentViewController {
                currentIndex = contentViewController.index
                onboardingDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
            }
        }
    }
}
