//
//  ViewController.swift
//  PitchPerfect2017
//
//  Created by Abdul Ahad on 12/8/17.
//  Copyright © 2017 G. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController,AVAudioRecorderDelegate {

    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet var recordbtnLabel: UIButton!
    @IBOutlet var recordSatus: UILabel!
    @IBOutlet var stopbtnLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("view did load first")
        self.stopbtnLabel.isEnabled = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear first")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did did apper first")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view didi disappear first")
    }
    
    
    
   
    @IBAction func recordButton(_ sender: Any) {
    self.recordbtnLabel.isEnabled = false
    self.recordSatus.text = "Recording in progress"
    self.stopbtnLabel.isEnabled = true
    
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print(filePath!)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopButton(_ sender: Any) {
        self.recordbtnLabel.isEnabled = true
        self.recordSatus.text = "Tap to Record"
        self.stopbtnLabel.isEnabled = false
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
      //  self.performSegue(withIdentifier: "play", sender: (Any).self) //actual
        
        
        
        
        
       // self.performSegue(withIdentifier: "play", sender: self.labelTxt.text)
        
    }
    
    // send data forward functionality
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            print("pass")
            let playSoundVC = segue.destination as! ViewController2
            let recorderAudioURL = sender as! URL
            playSoundVC.recordedAudioURL = recorderAudioURL
        }
    }
    
    
    // send data backward functionality
    @IBAction func didUnwindPerform(segue: UIStoryboardSegue) {
        if segue.identifier == "unwindSegue" {
            print("return")
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Finished Recording")
        if flag{
        performSegue(withIdentifier: "play", sender: audioRecorder.url)
        }else{
            print("recording was not successful")
        }
    }
}
