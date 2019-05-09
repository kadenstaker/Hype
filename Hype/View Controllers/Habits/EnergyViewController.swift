//
//  EnergyViewController.swift
//  Hype
//
//  Created by Kaden Staker on 5/1/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import UIKit
import Charts

class EnergyViewController: UIViewController {
    
    @IBOutlet weak var newBillButton: UIButton!
    @IBOutlet weak var barChartView: BarChartView!
    
    var usage: [Double] = []
    var date = [String]()
    var amount = [String]()
    
    var dataEntry: [BarChartDataEntry] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let xArray = Array(1..<10)
//        let ys1 = xArray.map { x in return sin(Double(x) / 2.0 / 3.141 * 1.5) }
//
//        let yse1 = ys1.enumerated().map { x, y in return BarChartDataEntry(x: Double(x), y: y) }
//
//        let data = BarChartData()
//        let ds1 = BarChartDataSet(entries: yse1, label: "KWhs")
//        ds1.colors = [NSUIColor(red: 0.19, green: 0.69, blue: 1, alpha: 1)]
//        data.addDataSet(ds1)
//
//        let barWidth = 0.4
//        let barSpace = 0.05
//        let groupSpace = 0.1
//
//        data.barWidth = barWidth
//        self.barChartView.xAxis.axisMinimum = Double(xArray[0])
//        self.barChartView.xAxis.axisMaximum = Double(xArray[0]) + data.groupWidth(groupSpace: groupSpace, barSpace: barSpace) * Double(xArray.count)
//        // (0.4 + 0.05) * 2 (data set count) + 0.1 = 1
//        data.groupBars(fromX: Double(xArray[0]), groupSpace: groupSpace, barSpace: barSpace)
//
//        self.barChartView.data = data
//
//        self.barChartView.gridBackgroundColor = NSUIColor.white
//
//        self.barChartView.chartDescription?.text = "Monthly Usage"
        
        setBarChart(dataPoints: amount, values: date)
    }
    
    func setBarChart(dataPoints: [String], values: [String]) {
        barChartView.noDataTextColor = UIColor.black
        barChartView.noDataText = "No data for the chart."
        barChartView.backgroundColor = UIColor.white
        
        for i in 0..<dataPoints.count {
            let dataPoint = BarChartDataEntry(x: Double(i), y: Double(values[i])!)
            print(dataPoint)
            dataEntry.append(dataPoint)
        }
        
                let chartDataSet = BarChartDataSet(entries: dataEntry, label: "gallons")
                let chartData = BarChartData()
                chartData.addDataSet(chartDataSet)
                chartData.setDrawValues(false)
                chartDataSet.colors = [UIColor(red: 0.19, green: 0.69, blue: 1, alpha: 1)]
        
                let formatter: ChartFormatter = ChartFormatter()
                formatter.setValues(values: dataPoints)
                let xaxis: XAxis = XAxis()
                xaxis.valueFormatter = formatter
                barChartView.xAxis.labelPosition = .bottom
                barChartView.xAxis.drawGridLinesEnabled = false
                barChartView.xAxis.valueFormatter = xaxis.valueFormatter
                barChartView.chartDescription?.enabled = false
                barChartView.legend.enabled = true
                barChartView.rightAxis.enabled = false
                barChartView.leftAxis.drawGridLinesEnabled = true
                barChartView.leftAxis.drawLabelsEnabled = true
                barChartView.data = chartData
        
            }
    
}

    
