//
//  TransportationViewController.swift
//  Hype
//
//  Created by Kaden Staker on 5/1/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit
import Charts

class TransportationViewController: UIViewController {
    
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var addGasButton: UIButton!
    
    var usage: [Double] = []
    var date: [String] = []
    var amount = [String]()
    
    var dataEntry: [BarChartDataEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateGraph()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateGraph()
    }
    // alert controller alternatively rather than segue into a view controller?
    @IBAction func unwindWithData(_ sender: UIStoryboardSegue) {
        if let viewController = sender.source as? AddBillViewController {
            usage.append(viewController.input)
        }
    }
    
    func updateGraph() {
        guard let barChartView = barChartView else { return }
        
        // this array that will eventually be displayed on the graph
        var barChartEntry = [BarChartDataEntry]()
        
        //for loop over every element in the array usage
        for i in 0..<usage.count {
            // set the x and y status in a data chart entry
            let value = BarChartDataEntry(x: Double(i), y: usage[i])
            // add it to the data set
            barChartEntry.append(value)
        }
        // convert barChartEntry to a BarChartDataSet
        let line1 = BarChartDataSet(entries: barChartEntry, label: "Date")
        
        // sets the color to blue
        line1.colors = [UIColor(red: 0.19, green: 0.69, blue: 1, alpha: 1)]
        // this is the object that will be added to the chart
        let data = BarChartData()
        
        //adds the line to the dataSet
        data.addDataSet(line1)
        // adds the chart data to the chart and causes an update
        barChartView.data = data
        // sets the title for the graph
        barChartView.chartDescription?.text = "Monthly Usage"
    }
}
