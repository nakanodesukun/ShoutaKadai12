//
//  ViewController.swift
//  12
//
//  Created by 中野翔太 on 2022/02/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var taxExcludedTextField: UITextField!
    @IBOutlet private weak var taxRateTextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!

    private let taxRateKey = "taxRate"

    override func viewDidLoad() {
        super.viewDidLoad()
        if let taxRate = UserDefaults.standard.string(forKey: taxRateKey) {
            taxRateTextField.text = taxRate
        }
    }


    @IBAction func calculateButton(_ sender: Any) {
        UserDefaults.standard.set(taxRateTextField.text, forKey: taxRateKey)
        guard let taxExcluded = Float(taxExcludedTextField.text ?? ""),
              let taxRate = Float(taxRateTextField.text ?? "") else { return }
        let amountIncludingTax = Int(taxExcluded + taxExcluded * (taxRate * 0.01))
        resultLabel.text = "\(amountIncludingTax)円"
    }
}
