//
//  ViewController2.swift
//  PitchPerfect2017
//
//  Created by Abdul Ahad on 12/10/17.
//  Copyright © 2017 G. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController2: UIViewController {

    
    //Outlet buttons
    @IBOutlet var snailButton: UIButton!
    @IBOutlet var chipmunkButton: UIButton!
    @IBOutlet var rabbitButton: UIButton!
    @IBOutlet var vederButton: UIButton!
    @IBOutlet var echoButton: UIButton!
    @IBOutlet var reverbButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    
    
    //Recorder audio
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    
    @IBAction func onClickListner(_ sender: AnyObject) {
        let buttonIndex = sender as! UIButton
        
        
        switch buttonIndex.tag {
        case 1:
            print("button1 pressed")
            playSound(rate:0.5)
        case 2:
            print("button2 pressed")
            playSound(rate: 1.5)
        case 3:
            print("button3 pressed")
            playSound(pitch:1000)
        case 4:
            print("button4 pressed")
            playSound(pitch:-1000)
        case 5:
            print("button5 pressed")
            playSound(echo:true)
        case 6:
            print("button6 pressed")
            playSound(reverb:true)
        case 7:
            print("stop button pressed")
            stopAudio()
        default:
            print("Default")
        }
        
        configureUI(.playing)
    }
}
