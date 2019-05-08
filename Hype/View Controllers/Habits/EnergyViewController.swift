//
//  EnergyViewController.swift
//  Hype
//
//  Created by Kaden Staker on 5/1/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit
import Charts

protocol GetChartData {
    func getChartData(with dataPoints: [String], values: [String])
    var date: [String] { get set }
    var amount: [String] { get set }
}

class EnergyViewController: UIViewController, GetChartData {
    
    var usage: [Double] = []
    
    var date = [String]()
    var amount = [String]()
    
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var enterBillButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateChartData()
        barChart()
        
    }
    
    private func updateChart() {
        // store all ourchart data
        var chartEntry = [ChartDataEntry]()
        // loop through the available usage and, for each of them, add a new ChartDataEntry(x: Double(i), y: usage[i]) that tells the chart the x and y positions
        for i in 0..<usage.count {
            let value = ChartDataEntry(x: Double(i), y: usage[i])
            chartEntry.append(value)
        }
        // set the color the bar chart
        let bar = BarChartDataSet(entries: chartEntry, label: "Usage")
        bar.colors = [UIColor(red: 0.19, green: 0.69, blue: 1, alpha: 1)]
        // add the bar which contains our data points.
        let data = BarChartData()
        data.addDataSet(bar)
        // add the data to the barChartView and set the bar chart view description
        barChartView.data = data
        barChartView.chartDescription?.text = "Monthly Usage"
    }
    // how to pass in the data from EnergyBillViewController's amountTextField into amount for the graph
    func populateChartData() {
        guard let energy = UserController.shared.users.first?.energy else { return }
        date = energy.compactMap({$0.date})
        let habit: [TrackableHabit] = energy
        let amount = habit.compactMap({$0.amount})
//        let date = ["Jan" ,"Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
//        let amount = ["12", "14", "133", "43", "22", "93", "45", "55", "79", "66", "18", "112"]
        self.getChartData(with: date, values: amount)
    }
    
    func barChart() {
        let barChart = BarChart(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height))
        barChart.delegate = self
        self.view.addSubview(barChart)
        
    }
    
    func getChartData(with dataPoints: [String], values: [String]) {
        self.date = values
        self.amount = dataPoints
    }
}

public class ChartFormatter: NSObject, IAxisValueFormatter {
    var date = [String]()
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return date[Int(value)]
    }
    
    public func setValues(values: [String]) {
        self.date = values
    }
}

    
