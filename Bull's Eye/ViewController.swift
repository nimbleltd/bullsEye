//
//  ViewController.swift
//  Bull's Eye
//
//  Created by Paul Campbell on 8/1/16.
//  Copyright © 2016 Nimble Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
//        currentValue = 50
        currentValue = lroundf(slider.value)
        slider.value = Float(currentValue)
    }


    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(title: "Hellow World",
                                      message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default,
                                   handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
        startNewRound()
        updateLabels()
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
//        print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }

}
