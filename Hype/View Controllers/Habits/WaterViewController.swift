//
//  WaterViewController.swift
//  Hype
//
//  Created by Kaden Staker on 5/1/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit
import Charts

class WaterViewController: UIViewController {
    
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var newBillButton: UIButton!
    
    var usage: [Double] = []
    var date: [String] = []
    var amount = [String]()
    
    var dataEntry: [BarChartDataEntry] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        updateGraph()
//        ChartFormatter()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateGraph()
//        ChartFormatter()
        
    }
    
    @IBAction func unwindWithData(_ sender: UIStoryboardSegue) {
        if let viewController = sender.source as? AddBillViewController {
            usage.append(viewController.input)
        }
    }
    
    
//    @IBAction func enterBillButtonTapped(_ sender: Any) {
//        let viewController = AddBillViewController()
//        self.navigationController?.pushViewController(viewController, animated: true)
//    }
    
    func updateGraph() {
        guard let barChartView = barChartView else { return }
                var barChartEntry = [BarChartDataEntry]()
        
        for i in 0..<usage.count {
            let value = BarChartDataEntry(x: Double(i), y: usage[i])
            barChartEntry.append(value)
        }
        let line1 = BarChartDataSet(entries: barChartEntry, label: "Date")
        
        line1.colors = [UIColor(red: 0.19, green: 0.69, blue: 1, alpha: 1)]
        let data = BarChartData()
        
        data.addDataSet(line1)
        barChartView.data = data
        barChartView.chartDescription?.text = "Monthly Usage"
    }
}
