//
//  ViewController.swift
//  12
//
//  Created by 中野翔太 on 2022/02/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var taxExcludedText: UITextField!
    @IBOutlet private weak var taxRateText: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!

    private let taxRateKey = "taxRate"

    override func viewDidLoad() {
        super.viewDidLoad()
        if let text2 = UserDefaults.standard.string(forKey: taxRateKey) {
            taxRateText.text = text2
        }
    }


    @IBAction func calculateButton(_ sender: Any) {
        UserDefaults.standard.set(taxRateText.text, forKey: taxRateKey)
        guard let taxExcluded = Float(taxExcludedText.text ?? ""),
              let taxRate = Float(taxRateText.text ?? "")  else { return }
        let amountIncludingTax = Int(taxExcluded + taxExcluded * (taxRate * 0.01))
        resultLabel.text = "\(amountIncludingTax)円"
    }
}
