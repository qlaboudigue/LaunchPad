//
//  ViewController.swift
//  LaunchPad
//
//  Created by Quentin Laboudigue on 27/05/2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // Properties
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var buttonTen: UIButton!
    @IBOutlet weak var buttonEleven: UIButton!
    @IBOutlet weak var buttonTwelve: UIButton!
    
    
    let blueGradient = UIImage(named: "blueGradient")
    let greenGradient = UIImage(imageLiteralResourceName: "greenGradient")
    
    var audioAsset: AVURLAsset!
    var player: AVAudioPlayer!
    var timer = Timer()
    
    // Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonList = [buttonOne, buttonTwo, buttonThree, buttonFour, buttonFive, buttonSix, buttonSeven, buttonEight, buttonNine, buttonTen, buttonEleven, buttonTwelve]
        
        for i in 0..<buttonList.count {
            buttonList[i]?.accessibilityLabel = "\(i+1)"
            let image = UIImage(named: "\(i+1)")
            buttonList[i]?.setBackgroundImage(blueGradient, for: .normal)
            buttonList[i]?.setImage(image, for: .normal)
            buttonList[i]?.contentMode = .center
            buttonList[i]?.imageView?.contentMode = .scaleAspectFit
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let key = sender.accessibilityLabel {
            sender.setBackgroundImage(greenGradient, for: .normal)
            timer = Timer.scheduledTimer(withTimeInterval: timeDuration(key: key), repeats: false) { timer in
                sender.setBackgroundImage(self.blueGradient, for: .normal)
            }
            playSound(key: key)
        }
    }
    
    func playSound(key: String) {
        let url = Bundle.main.url(forResource: key, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func timeDuration(key: String) -> Double {
        if let url = Bundle.main.url(forResource: key, withExtension: "wav") {
            audioAsset = AVURLAsset(url: url)
            let duration = audioAsset.duration
            let durationSeconds = CMTimeGetSeconds(duration)
            return Double(durationSeconds)
        } else {
            return 0.0
        }
    }
    
    
}

