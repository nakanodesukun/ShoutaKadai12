//
//  ViewController.swift
//  12
//
//  Created by 中野翔太 on 2022/02/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var textField1: UITextField!
    @IBOutlet private weak var textField2: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        if let text2 = UserDefaults.standard.string(forKey: "key") {
            textField2.text = text2
        }
    }


    @IBAction func calculateButton(_ sender: Any) {
        UserDefaults.standard.set(textField2.text, forKey: "key")
        guard let taxExcluded = Float(textField1.text ?? ""),
              let taxRate = Float(textField2.text ?? "")  else { return }
        let amountIncludingTax = Int(taxExcluded + taxExcluded * (taxRate * 0.01))
        resultLabel.text = "\(amountIncludingTax)円"
    }
}
