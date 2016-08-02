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
    var score: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

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
        scoreLabel.text = String(score)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
//        currentValue = 50
        //Sets current value = to existing slider value
        currentValue = lroundf(slider.value)
        //Sets slider value to the current value
        slider.value = Float(currentValue)
    }


    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = (100 - difference)
        score += points
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)" + "\nYou missed the target by \(difference)" + "\nAnd you have scored \(points) points."
        
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
