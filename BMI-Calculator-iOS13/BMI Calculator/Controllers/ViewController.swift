//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.2f", sender.value)
        weightLabel.text = "\(weight )Kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = String(format: "%.2f", heightSlider.value)
        let weight = String(format: "%.2f", weightSlider.value)
        let BMI = Float(weight)! / (Float(height)! * 2)
        
        let height2 = heightSlider.value
        let weight2 = weightSlider.value
        let bmi = weight2 / pow(height2, 2)
        
        print("BMI : \(BMI)")
        print("bmi : \(bmi)")
        
    }
    
    func updateUI(){
    }

}

