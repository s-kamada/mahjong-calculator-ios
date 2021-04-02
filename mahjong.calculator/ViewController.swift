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
    @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")

        calculateButton.addTarget(self, action: #selector(calc), for: .touchUpInside)
    }

    @objc func calc() {
        guard let fan = fanTextField.text,
              let fu = fuTextField.text,
              !fan.isEmpty, !fu.isEmpty else { return }

        let score: Int = CalculateSupprt.score(fan: Int(fan) ?? 0, fu: Int(fu) ?? 0, position: .nonDealer)

        print("\(fan) fan \(fu) fu \n \(score)")
        scoreLabel.text = String(score)
    }
}

