
//
//  LapViewController.swift
//  StopWatch2
//
//  Created by KFCC on 2015/05/24.
//  Copyright (c) 2015年 KFCC. All rights reserved.
//

import UIKit

class LapViewController: UIViewController {
    @IBOutlet var laptimeLabel: UILabel!
    @IBOutlet var amountlapLabel: UILabel!
    
    var laps: Array<Float>!
    var number: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if laps.count>0{
            number = 1
            println(laps[0])
            laptimeLabel.text = String(format: "%.3f", laps[0])
            self.amountlaps()
        }else{
            laptimeLabel.text = "NONE"
            amountlapLabel.text = "NONE"
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func next() {
        if number < laps.count {
            laptimeLabel.text = String(format: "%.3f", laps[number])
            number = number+1
            self.amountlaps()
        }
    }
    
    @IBAction func back() {
        if number > 1 {
            number = number-1
            laptimeLabel.text = String(format: "%.3f", laps[number-1])
            self.amountlaps()
        }
    }
    
    @IBAction func previousView() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func amountlaps(){
        amountlapLabel.text = String(format: "LAP:%d",number)
    }
}
