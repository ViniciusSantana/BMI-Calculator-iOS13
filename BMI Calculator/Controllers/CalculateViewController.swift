//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightValueLabel.text = String(format: "%.2fm", sender.value)

    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        calculateBMI()
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightValueLabel.text = String(format: "%.0fKg", sender.value)
    
    }
    
    func calculateBMI(){
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(weight: weight, height: height)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            let bmi = calculatorBrain.getBMI()
            destinationVC.bmiValue = String(format: "%.1f", bmi)
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getBackgroundColor()
            
        }
        
        
    }
}

