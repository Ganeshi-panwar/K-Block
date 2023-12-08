//
//  HistoryNumberOfAdBlockViewController.swift
//  K-Block
//
//  Created by Mohit Mali on 31/10/23.
//
import Charts
import UIKit

class HistoryNumberOfAdBlockViewController: UIViewController,ChartViewDelegate {
    
    @IBOutlet var nubmerOdAdblock: UIButton!
    @IBOutlet var savingCommunicationTime: UIButton!
    
    
    @IBOutlet var switching: [UIButton]!
    
    
    var lineChart = LineChartView()
    override func viewDidLoad() {
        super.viewDidLoad()
        lineChart.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lineChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        lineChart.center = view.center
        view.addSubview(lineChart)
        
        
        var entries = [ChartDataEntry]()
        
        for x in 0..<10{
            entries.append(ChartDataEntry(x: Double(x),
                                          y: Double(x)))
            
    }
        let set = LineChartDataSet(entries: entries )
        set.colors = ChartColorTemplates.colorful()
        let data = LineChartData(dataSet: set)
        lineChart.data = data
    }
    
    
    @IBAction func HourButtonTapped(_ sender: UIButton) {
//        for button in switching{
//            button.isSelected = false
//            button.backgroundColor = UIColor.lightGray
//            button.setTitleColor(UIColor.darkGreen, for: .normal)
//        }
//        sender.isSelected.toggle()
//        sender.backgroundColor = sender.isSelected ? UIColor.darkGreen : UIColor.clear
//        sender.setTitleColor(sender.isSelected ? UIColor.darkGreen : UIColor.lightOrange, for: .normal)
//        for (index, button) in switching.enumerated(){
//            button.tag = index
//            button.addTarget(self, action: #selector(HourButtonTapped(_:)), for: .touchUpInside)
//        }
    }
    
    
    
    
    @IBAction func theDayBeforeButtontapped(_ sender: UIButton) {
        
    }
    
    
    @IBAction func oneWeekButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func oneMothsButtonTapped(_ sender: UIButton) {
    }
    @IBAction func sixMonthsButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func numberOfAdBlocksButtonTapped
    (_ sender: UIButton) {
        
    }
    
    
    @IBAction func savingCommunicationChargesButtonTapped(_ sender: UIButton) {
    }
    
}
