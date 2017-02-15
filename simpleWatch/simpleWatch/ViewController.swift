//
//  ViewController.swift
//  simpleWatch
//
//  Created by Mario Vizcaino on 14/02/17.
//  Copyright © 2017 Mario Vizcaino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Buttons References
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    
    var Counter = 0.0
    var timer = Timer()
    var IsPlaying = false

    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = String(Counter)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //button Actions
    @IBAction func playButtonAction(_ sender: UIButton) {
        start()
    }
    @IBAction func pauseButtonAction(_ sender: UIButton) {
        pause()
    }
    @IBAction func resetButtonAction(_ sender: UIButton) {
        reset()
    }
}

//App Functions
extension ViewController{
    func pause(){
        handleButtons(start: true, pause: false)
        timer.invalidate()
        IsPlaying = false
    }
    func reset(){
        timer.invalidate()
        IsPlaying = false
        Counter = 0
        timerLabel.text = String(Counter)
        handleButtons(start: true, pause: true)
    }
    func start(){
        if(IsPlaying) {
            return
        }
        handleButtons(start: false, pause: true)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.UpdateTimer), userInfo: nil, repeats: true)
        IsPlaying = true
    }
    func handleButtons(start: Bool, pause: Bool){
        startButton.isEnabled  = start
        pauseButton.isEnabled  = pause
    }
    func UpdateTimer() {
        Counter = Counter + 0.1
        timerLabel.text = String(format: "%.1f", Counter)
    }
}
