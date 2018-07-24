//
//  ViewController.swift
//  SwiftWithJS
//
//  Created by Swapnil Sankla on 23/07/18.
//  Copyright © 2018 Swapnil Sankla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, View {

    @IBOutlet weak var argument1: UITextField!
    @IBOutlet weak var argument2: UITextField!
    @IBOutlet weak var result: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var MultiplyButton: UIButton!
    @IBOutlet weak var DivideButton: UIButton!
    @IBOutlet weak var footerView: UILabel!
    
    let presenter = Presenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        result.isEnabled = false
        configureLayoutFor(button: addButton)
        configureLayoutFor(button: subtractButton)
        configureLayoutFor(button: MultiplyButton)
        configureLayoutFor(button: DivideButton)
        presenter.viewDidLoad()
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        presenter.addButtonTapped(argument1: argument1.text,
                                  argument2: argument2.text)
    }

    @IBAction func subtractButtonTapped(_ sender: Any) {
        presenter.subtractButtonTapped(argument1: argument1.text,
                                       argument2: argument2.text)
    }

    @IBAction func multiplyButtonTapped(_ sender: Any) {
        presenter.multiplyButtonTapped(argument1: argument1.text,
                                       argument2: argument2.text)
    }

    @IBAction func divideButtonTapped(_ sender: Any) {
        presenter.divideButtonTapped(argument1: argument1.text,
                                     argument2: argument2.text)
    }

    func setResult(result: String) {
        self.result.text = result
    }

    func setCopyRightInfo(info: String) {
        self.footerView.text = info
    }

    private func configureLayoutFor(button: UIButton) {
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 10
    }
}
