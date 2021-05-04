//
//  ViewController.swift
//  BullsEye
//
//  Created by Lai Po Ying on 2021/4/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var randomNumberLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    var randomNumber = Int.random(in: 1...100)
    var score = 0
    var round = 1
    func startOver() {
        round = round + 1
        roundLabel.text = "\(round)"
        randomNumber = Int.random(in: 1...100)
        randomNumberLabel.text = "\(randomNumber)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumberLabel.text = "\(randomNumber)"
        scoreLabel.text = "\(score)"
        roundLabel.text = "\(round)"
        let sliderPointNormalImage = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(sliderPointNormalImage, for: .normal)
        let sliderPointHighlightedImage = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(sliderPointHighlightedImage, for: .highlighted)
        let insets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }

    @IBAction func showAlert() {
        let answer = Int(slider.value.rounded()) - randomNumber
        if answer == 0 {
            let alert = UIAlertController(title: "Perfect", message: "Your target is \(randomNumber) and the value of slider is \(Int(slider.value.rounded())), you get 500 point", preferredStyle: .alert)
            let action = UIAlertAction(title: "Awesome", style: .default, handler: {
                action in
                self.score = self.score + 500
                self.scoreLabel.text = "\(self.score)"
                self.startOver()
            })
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        } else if answer < 5, answer > -5 {
            let alert = UIAlertController(title: "Great", message: "Your target is \(randomNumber) and the value of slider is \(Int(slider.value.rounded())), you get 200 point", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: {
                action in
                self.score = self.score + 200
                self.scoreLabel.text = "\(self.score)"
                self.startOver()
            })
            alert.addAction(action)
            present(alert, animated: true, completion: nil)

        } else if answer < 10, answer > -10 {
            let alert = UIAlertController(title: "Not bad", message: "Your target is \(randomNumber) and the value of slider is \(Int(slider.value.rounded())), you get 100 point", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: {
                action in
                self.score = self.score + 100
                self.scoreLabel.text = "\(self.score)"
                self.startOver()
            })
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Seriously?!", message: "Your target is \(randomNumber) and the value of slider is \(Int(slider.value.rounded())), you get 0 point, loser!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: {
                action in
                self.score = self.score + 0
                self.scoreLabel.text = "\(self.score)"
                self.startOver()
            })
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    
    }
    @IBAction func resetButton(_ sender: UIButton) {
        round = 1
        roundLabel.text = "\(round)"
        score = 0
        scoreLabel.text = "\(score)"
        randomNumber = Int.random(in: 1...100)
        randomNumberLabel.text = "\(randomNumber)"
    }
    
    

}

