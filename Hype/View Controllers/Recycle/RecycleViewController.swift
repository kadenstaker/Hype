//
//  RecycleViewController.swift
//  Hype
//
//  Created by Hannah Hoff on 5/5/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit

class RecycleViewController: UIViewController {

    @IBOutlet weak var buttonBackView: UIView!
    @IBOutlet weak var recycleCenterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recycleCentersButtonTapped(_ sender: Any) {
        guard let url = URL(string: "http://www.recyclerfinder.com/") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func openUrl(urlString: String) {
        if let url = URL(string:urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            
        }
    }
    
    func update() {
        buttonBackView.createShadow(with: .white, width: 4, height: 4, redValue: 0, greenValue: 0, blueValue: 0, alphaValue: 0.5, opacity: 4, radius: 4)
        recycleCenterButton.layer.cornerRadius = 4
        buttonBackView.layer.cornerRadius = 4
        
    }
}
