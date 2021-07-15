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
        sliderValuelabel.text = String(slider.value)
    }

    @IBAction func touchUpHitButton(_ sender: UIButton){
        print(slider.value)
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
    }
    
}

