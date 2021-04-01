//
//  ViewController.swift
//  mahjong.calculator
//
//  Created by 鎌田峻輔 on 2021/03/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fanTextField: UITextField!
    @IBOutlet weak var fuTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")

        calculateButton.addTarget(self, action: #selector(calc), for: .touchUpInside)
    }

    @objc func calc() {
        guard let fan = fanTextField.text,
              let fu = fuTextField.text,
              !fan.isEmpty, !fu.isEmpty else { return }

        print("\(fan) fan \(fu) fu")
    }
}

