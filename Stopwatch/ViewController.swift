//
//  ViewController.swift
//  Stopwatch
//
//  Created by Diego Rodrigues de Oliveira on 1/14/19.
//  Copyright © 2019 Langara. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    let stopwatch = Stopwatch()
    
    var timer: Timer?
    
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    @IBOutlet weak var resumeButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resumeButton.isHidden = true;
        stopButton.isEnabled = false
        resetButton.isEnabled = false
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
//        print("start")
        stopwatch.start()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateElapsedTimeLabel(timer:)), userInfo: nil, repeats: true)
        
        startButton.isEnabled = false
        resetButton.isEnabled = true
        resumeButton.isHidden = true
        stopButton.isEnabled = true
        
        
    }
    @IBAction func stopButtonTapped(_ sender: UIButton) {
//        print("stop")
        stopwatch.stop()
        resumeButton.isHidden = false
        startButton.isHidden = true
        resumeButton.isEnabled = true
        stopButton.isEnabled = false
        
    }
    
    @IBAction func resumeButtonTapped(_ sender: UIButton) {
//        print("resume")
        stopwatch.resume()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateElapsedTimeLabel(timer:)), userInfo: nil, repeats: true)
        resumeButton.isEnabled = false
        stopButton.isEnabled = true
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        stopwatch.reset()
//        print("reset")
        elapsedTimeLabel.text = "00:00:0"
        startButton.isEnabled = true
        startButton.isHidden = false
        resumeButton.isHidden = true
        resetButton.isEnabled = false
        stopButton.isEnabled = false
    }
    
    @objc func updateElapsedTimeLabel(timer: Timer){
        //print("updating")
        
        if stopwatch.isRunning{
            let minutes = Int(stopwatch.elapsedTime / 60)
            let seconds = Int(stopwatch.elapsedTime.truncatingRemainder(dividingBy: 60))
            let tenths = Int((stopwatch.elapsedTime * 10).truncatingRemainder(dividingBy: 10))
            elapsedTimeLabel.text = String(format: "%02d:%02d:%d", minutes,seconds,tenths)
        } else{
            timer.invalidate()
            
        }
    }
    
    deinit{
        if let timer = self.timer{
            timer.invalidate()
        }
    }
}

