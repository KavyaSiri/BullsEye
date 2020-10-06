//
//  ViewController.swift
//  BullsEyePractice
//
//  Created by Goutham Mac Mini on 13/08/20.
//  Copyright © 2020 df. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    var currentValue : Int = 0
    var targetValue : Int = 0
    var score = 0
    var round = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
         
        startNewGame()
       //startNewRound()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable , for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable , for: .normal)
    }

    @IBAction func showAlert(){
        
//      var difference = currentValue - targetValue
//
//        if difference < 0 {
//            difference = difference * -1
//        }
        
    let difference = abs(targetValue - currentValue)
        var points = 100 - difference
          score += points
        let title : String
        if difference == 0 {
            title = "Perfect!"
            points +=  100
        }
        else if difference < 5{
            title = "You are almost close"
            if difference == 1 {
                points += 50
            }
        }
        else if difference < 10{
            title = "Pretty Good"
        }
        else {
            title = "Not even Close"
             
        }
        let message = "You scored : \(points) points"
        //let message = "the Value of the slider is now: \(currentValue)" + "\n the  target value is \(targetValue)" + "\n the difference is \(difference)"
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        //startNewRound()
    }

    @IBAction func sliderMoved(_ slider : UISlider){
        
        print("The value of the slider is now: \(slider.value)")
        
        let roundedValue = slider.value.rounded()
           print("The value of the slider is now: \(roundedValue)")
        currentValue = Int(roundedValue)
                
    }
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 25
        slider.value = Float(currentValue)
             
        updateLabels()
    }
    
   func updateLabels(){
        targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
    }
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
   
}

