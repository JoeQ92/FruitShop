//
//  ShoppingViewController.swift
//  FruitShop
//
//  Created by Joseph Quesne on 15/03/2020.
//  Copyright © 2020 JQ. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var applesTextField: UITextField!
    @IBOutlet weak var orangesTextField: UITextField!
    @IBOutlet weak var totalPriceTextField: UITextField!
    
    // MARK: - Properties
    private let shoppingViewModel = ShoppingViewModel()

    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHideKeyboardOnTap()
        applesTextField.delegate = self
        orangesTextField.delegate = self
    }
    
    // MARK: - Action
    @IBAction func checkoutBtnAction(_ sender: UIButton) {
        if let applesText = applesTextField.text,
            let appleQuantity = Int(applesText)
        {
            shoppingViewModel.addFruitToBasket(fruit: Fruit.apple, quantity: appleQuantity)
        }
        
        if let orangesText = orangesTextField.text,
            let orangesQuantity = Int(orangesText)
        {
            shoppingViewModel.addFruitToBasket(fruit: Fruit.orange, quantity: orangesQuantity)
        }
        
        let totalPrice = shoppingViewModel.getTotalPrice()
        totalPriceTextField.text = String(format: "£%0.2f", totalPrice)
        shoppingViewModel.emptyBasket()
    }
}

// MARK: - UITextField Delegate
extension ShoppingViewController:UITextFieldDelegate
{
    // Only allow numeric characters
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {
            return false
        }
        return true
    }
}

// MARK: - Hide Keyboard on Background Touch
extension ShoppingViewController
{
    func setupHideKeyboardOnTap()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(ShoppingViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
