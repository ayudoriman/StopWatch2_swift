//
//  ViewController.swift
//  StopWatch2
//
//  Created by KFCC on 2015/05/24.
//  Copyright (c) 2015年 KFCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var Label: UILabel!
    @IBOutlet var lapLabel: UILabel!
    
    var count: Float = 0.0
    var timer: NSTimer = NSTimer()
    
    var laps: Array<Float> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Label.text = "0.00"
        lapLabel.text = "0.00"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var lapViewController = segue.destinationViewController as! LapViewController
        
        lapViewController.laps = self.laps
    }
    
    func up(){
        count = count + 0.01
        Label.text = String(format: "%.2f", count)
    }
    
    @IBAction func start(){
        if timer.valid{
            timer.invalidate()
            //hantei()
        }else if !timer.valid{
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
                target: self,
                selector: Selector("up"),
                userInfo: nil,
                repeats: true)
        }
    }
    
    @IBAction func lap(){
        laps.append(count)
        lapLabel.text = String(format: "%.2f", count)
    }
    
    @IBAction func clear(){
        if timer.valid{
            timer.invalidate()
        }else{
            timer.invalidate()
            count = 0.0
            Label.text = String(format: "%.2f", count)
            lapLabel.text = "0.00"
            laps = []
            
            
        }
    }


}

