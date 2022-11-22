//
//  ViewController.swift
//  Roll Again V3-LN
//
//  Created by Lauren Najera on 11/21/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var diceImageView: UIImageView!
    @IBOutlet var criticalLabel: UILabel!
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonGotPressed()
    {
        rollDice()
    }
    
    func rollDice()
    {
        print("And nothing can go wrong!")
        
        let rolledNumber = Int.random(in: 1...20)
        let imageName = "d\(rolledNumber)"
        
        diceImageView.image = UIImage(named: imageName)
//        criticalLabel.text = (rolledNumber)
        if(rolledNumber == 20)
        {
            criticalLabel.text = "Critical Success"
            
        }
        let pathToSound = Bundle.main.path(forResource: "rolldice", ofType: "mp3")!
        let successSound = Bundle.main.path(forResource: "zfanfare", ofType: "mp3")!
        let failSound = Bundle.main.path(forResource: "failwah", ofType: "mp3")!
        
        if(rolledNumber == 20)
        {
            criticalLabel.text = "Critical Success"
            let url = URL(fileURLWithPath: successSound)
            do
            {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
            catch
            {
                print("Oh No, it all went wrong!")
            }
            
        }
        else if(rolledNumber == 1)
        {
            criticalLabel.text = "Critical Miss"
            let url = URL(fileURLWithPath: failSound)
            do
            {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
            catch
            {
                print("Oh No, it all went wrong!")
            }
        }
        else
        {
            criticalLabel.text = ""
            let url = URL(fileURLWithPath: pathToSound)
            do
            {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
            catch
            {
                print("Oh No, it all went wrong!")
            }
            
        }
    }
        
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?)
    {
        if (motion == .motionShake)
            {
                rollDice();
            }
    }
}
