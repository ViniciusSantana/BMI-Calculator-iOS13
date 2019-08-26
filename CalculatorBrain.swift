//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Vinicius Santana on 09/06/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {

    var bmi : BMI?
    
    mutating func calculateBMI(weight : Float, height : Float) {
        let bmiValue = weight / pow(height,2)
        bmi = createBMI(bmiValue)
        
    }
    
    func getBMI() -> Float {
        return bmi?.value ?? 0
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getBackgroundColor() -> UIColor {
        return bmi?.backgroundColor ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func createBMI(_ bmiValue : Float) -> BMI{
        let advice : String
        let color : UIColor
        
        if bmiValue < 18.5{
            advice = "Eat more pies"
            color = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        }else if bmiValue < 24.9 {
            advice = "Fit as a fiddle!"
            color = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            
        }else{
            advice = "Eat less pies"
            color = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        }
        
        return BMI(value: bmiValue, advice: advice, backgroundColor: color)
    }
}
