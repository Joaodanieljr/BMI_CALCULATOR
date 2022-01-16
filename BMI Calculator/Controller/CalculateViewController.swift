//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Joao daniel on 02/01/22.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var heightSliderValue: UISlider!
    @IBOutlet weak var weightSliderValue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightValue.text = "1m"
        weightValue.text = "55kg"
        
    }

    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightValue.text = String(format:"%.2f", sender.value) + "m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightValue.text = String(format:"%.0f", sender.value) + "kg"
    }
    
    @IBAction func CalculatePressed(_ sender: UIButton) {
        calculatorBrain.calculateBMI(height: heightSliderValue.value, weight: weightSliderValue.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}

