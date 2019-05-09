////
////  BarChart.swift
////  Hype
////
////  Created by Hannah Hoff on 5/7/19.
////  Copyright © 2019 Kaden Staker. All rights reserved.
////
//
//import UIKit
//import Charts
//
//class BarChart: UIView {
//
//    let barChartView = BarChartView()
//    var dataEntry: [BarChartDataEntry] = []
//
//    var date = [String]()
//    var amount = [String]()
//
//    var delegate: GetChartData! {
//        didSet {
//            populateData()
//            barChartSetup()
//        }
//    }
//
//    func populateData() {
//        amount = delegate.amount
//        date = delegate.date
//    }
//
//    func barChartSetup() {
//        self.backgroundColor = UIColor.white
//        self.addSubview(barChartView)
//        barChartView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint(item: barChartView, attribute: .top, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 2).isActive = true
//        NSLayoutConstraint(item: barChartView, attribute: .bottom, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: -250).isActive = true
//        NSLayoutConstraint(item: barChartView, attribute: .leading, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 16).isActive = true
//        NSLayoutConstraint(item: barChartView, attribute: .trailing, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -16).isActive = true
//
//        setBarChart(dataPoints: amount, values: date)
//    }
//
//    func setBarChart(dataPoints: [String], values: [String]) {
//        barChartView.noDataTextColor = UIColor.black
//        barChartView.noDataText = "No data for the chart."
//        barChartView.backgroundColor = UIColor.white
//
//        for i in 0..<dataPoints.count {
//            let dataPoint = BarChartDataEntry(x: Double(i), y: Double(values[i])!)
//            print(dataPoint)
//            dataEntry.append(dataPoint)
//        }
//
//        let chartDataSet = BarChartDataSet(entries: dataEntry, label: "gallons")
//        let chartData = BarChartData()
//        chartData.addDataSet(chartDataSet)
//        chartData.setDrawValues(false)
//        chartDataSet.colors = [UIColor(red: 0.19, green: 0.69, blue: 1, alpha: 1)]
//
//        let formatter: ChartFormatter = ChartFormatter()
//        formatter.setValues(values: dataPoints)
//        let xaxis: XAxis = XAxis()
//        xaxis.valueFormatter = formatter
//        barChartView.xAxis.labelPosition = .bottom
//        barChartView.xAxis.drawGridLinesEnabled = false
//        barChartView.xAxis.valueFormatter = xaxis.valueFormatter
//        barChartView.chartDescription?.enabled = false
//        barChartView.legend.enabled = true
//        barChartView.rightAxis.enabled = false
//        barChartView.leftAxis.drawGridLinesEnabled = true
//        barChartView.leftAxis.drawLabelsEnabled = true
//        barChartView.data = chartData
//
//    }
//}
