//
//  ViewController.swift
//  eggTimer
//
//  Created by Jonathan Canales on 2/11/21.
//

import UIKit

import AVFoundation

var player: AVAudioPlayer?

class ViewController: UIViewController {

   //Eggtimes -> 5, 7, 14
    
    // SOFT -> 5
    // Medium -> 7
    // Hard -> 14
    
    var eggTimes = ["Soft" :5, "Medium":7,"Hard":14]
    var startTime = 0
    var totalTime = 0
    var timer = Timer()
    
    @IBOutlet weak var outputLabel: UILabel!

    @IBOutlet weak var progressLabel: UIProgressView!
    
    
    @IBAction func pressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        startTime = 0
        totalTime = eggTimes[hardness]!
        
        progressLabel.progress = 0.0

        timer.invalidate()
        outputLabel.text = hardness
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }


        
    
        @objc func updateCounter() {
            //example functionality
            if startTime < totalTime {
                startTime += 1
                progressLabel.progress = Float((startTime))/Float((totalTime))
            }
            else {
                outputLabel.text = "Done"
                let path = Bundle.main.path(forResource: "ring", ofType: "wav")!
                    let url = URL(fileURLWithPath: path)
                do {
                    let sound = try AVAudioPlayer(contentsOf: url)
                    player = sound
                    sound.play()
                } catch {
                    //
                }
                timer.invalidate()
                
            }
        }



}

