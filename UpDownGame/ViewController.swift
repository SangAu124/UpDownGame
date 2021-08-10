//
//  ViewController.swift
//  UpDownGame
//
//  Created by DGSW on 2021/07/01.
//

import UIKit

class ViewController: UIViewController {
    
    var randomValue: Int = 0
    var tryCount: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountlabel: UILabel!
    @IBOutlet weak var sliderValuelabel: UILabel!
    @IBOutlet weak var minimumValuelabel: UILabel!
    @IBOutlet weak var maximumValuelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        reset()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider){
        print(sender.value)
        let integerValue: Int = Int(sender.value)
        sliderValuelabel.text = String(integerValue)
    }
    
    func showAlert(message: String){
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.reset()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func touchUpHitButton(_ sender: UIButton){
        print(slider.value)
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount = tryCount + 1
        tryCountlabel.text = "\(tryCount) / 5"
        
        if randomValue == hitValue{
            showAlert(message: "YOU HIT!!")
            print("YOU HIT!!")
            reset()
            return
        } else if tryCount >= 5{
            showAlert(message: "You lose...")
            print("You lose...")
            reset()
            return
        } else if randomValue > hitValue{
            slider.minimumValue = Float(hitValue)
            minimumValuelabel.text = String(hitValue)
        } else {
            slider.maximumValue = Float(hitValue)
            maximumValuelabel.text = String(hitValue)
        }
            
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton){
        print("touch up reset button")
        reset()
    }
    
    func reset(){
        print("reset!")
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        tryCount = 0
        tryCountlabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValuelabel.text = "0"
        maximumValuelabel.text = "30"
        sliderValuelabel.text = "15"
    }
    
}

