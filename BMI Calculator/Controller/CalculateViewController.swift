//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Joao daniel on 02/01/22.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var heightSliderValue: UISlider!
    @IBOutlet weak var weightSliderValue: UISlider!
    
    var bmiValue = "0.0"
    
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
        let bmi = weightSliderValue.value / pow(heightSliderValue.value, 2)
        bmiValue = String(format:"%.1f", bmi)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiValue
        }
    }
    
}

