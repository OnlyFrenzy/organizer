//
//  CalculatorViewController.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 06.10.2020.
//

import UIKit


class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var sqrtButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var changeSignButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var multButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var viewModel: CalculatorViewModel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        viewModel = CalculatorViewModel()
        viewModel.displayDelegate = self
        setupButtons()
    }
    
    @IBAction func onClickNumberButton(_ sender: UIButton) {
        viewModel.onClickNumberButton(number: sender.tag)
    }
    
    private func setupButtons() {
        sqrtButton.setTitleColor(viewModel.signButtonColor(), for: .normal)
        sqrtButton.addTarget(self, action: #selector(onClickSqrtButton), for: .touchUpInside)
        dotButton.setTitleColor(viewModel.signButtonColor(), for: .normal)
        dotButton.addTarget(self, action: #selector(onClickDotButton), for: .touchUpInside)
        clearButton.setTitleColor(viewModel.signButtonColor(), for: .normal)
        clearButton.addTarget(self, action: #selector(onClickClearButton), for: .touchUpInside)
        changeSignButton.setTitleColor(viewModel.signButtonColor(), for: .normal)
        changeSignButton.addTarget(self, action: #selector(onClickChangeSignButton), for: .touchUpInside)
        plusButton.setTitleColor(viewModel.signButtonColor(), for: .normal)
        plusButton.addTarget(self, action: #selector(onClickPlusButton), for: .touchUpInside)
        percentButton.setTitleColor(viewModel.signButtonColor(), for: .normal)
        percentButton.addTarget(self, action: #selector(onClickBracketsButton), for: .touchUpInside)
        minusButton.setTitleColor(viewModel.signButtonColor(), for: .normal)
        minusButton.addTarget(self, action: #selector(onClickMinusButton), for: .touchUpInside)
        calculateButton.setTitleColor(viewModel.signButtonColor(), for: .normal)
        calculateButton.addTarget(self, action: #selector(onClickCalculateButton), for: .touchUpInside)
        divisionButton.setTitleColor(viewModel.signButtonColor(), for: .normal)
        divisionButton.addTarget(self, action: #selector(onClickDivisionButton), for: .touchUpInside)
        multButton.setTitleColor(viewModel.signButtonColor(), for: .normal)
        multButton.addTarget(self, action: #selector(onClickMultButton), for: .touchUpInside)
    }

    @objc
    private func onClickSqrtButton() {
        viewModel.onClickSqrtButton()
    }
    
    @objc
    private func onClickDotButton() {
        viewModel.onClickDotButton()
    }
    
    @objc
    private func onClickClearButton() {
        viewModel.onClickClearButton()
    }
    
    @objc
    private func onClickChangeSignButton() {
        viewModel.onClickChangeSignButton()
    }
    
    @objc
    private func onClickPlusButton() {
        viewModel.onClickPlusButton()
    }
    
    @objc
    private func onClickBracketsButton() {
        viewModel.onClickBracketsButton()
    }
    
    @objc
    private func onClickMinusButton() {
        viewModel.onClickMinusButton()
    }
    
    @objc
    private func onClickCalculateButton() {
        viewModel.onClickCalculateButton()
    }
    
    @objc
    private func onClickDivisionButton() {
        viewModel.onClickDivisionButton()
    }
    
    @objc
    private func onClickMultButton() {
        viewModel.onClickMultButton()
    }
}


extension CalculatorViewController: CalculatorDisplayDelegate {
    func showCurrentValue(value: String) {
        resultLabel.text = value
    }
}
