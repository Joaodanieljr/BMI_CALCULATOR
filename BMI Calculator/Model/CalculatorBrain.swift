//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Joao daniel on 13/01/22.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Erro!!!"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.red
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2.0)
        
        switch bmiValue {
        case ..<18.5:
            bmi = BMI(value: bmiValue, advice: "O seu nivel esta baixo, bora se alimentar melhor", color:UIColor.blue)
            break
        case 18.5...24.9:
            bmi = BMI(value: bmiValue, advice: "Otimo numero, parabens!!!", color: UIColor.init(red: 49/255, green: 149/255, blue: 29/255, alpha: 1.0))
            break
        case 24.9...:
            bmi = BMI(value: bmiValue, advice: "Esse numero não esta legal, que tal um pouco de dieta e exercicios", color: UIColor.red)
            break
        default:
            bmi = BMI(value: 0.0, advice: "Erro!!!", color: UIColor.red)
        }
        
        
       
    }
}
