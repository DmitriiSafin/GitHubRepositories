//
//  AuthViewController.swift
//  GitHubRepositories
//
//  Created by Дмитрий on 30.05.2023.
//

import UIKit

final class AuthViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tokenTextField: UITextField!
    @IBOutlet weak var invalidTokenLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
    
    //MARK: - Initial
    override func viewDidLoad() {
        super.viewDidLoad()
        tokenTextField.delegate = self
        setupUI()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func signInTapped(_ sender: UIButton) {
    }
    

    
    private func invalidToken() {
        tokenTextField.layer.borderColor = UIColor(red: 0.796, green: 0.308, blue: 0.308, alpha: 1).cgColor
    }
    
}

//MARK: - UITextFieldDelegate
extension AuthViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateButton(signInButton, up: true)
        tokenTextField.layer.borderColor = UIColor(red: 0.345, green: 0.651, blue: 1, alpha: 1).cgColor
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        tokenTextField.layer.borderColor = UIColor(red: 0.129, green: 0.149, blue: 0.176, alpha: 1).cgColor
//        animateButton(signInButton, up: false)
//    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        tokenTextField.layer.borderColor = UIColor(red: 0.129, green: 0.149, blue: 0.176, alpha: 1).cgColor
        animateButton(signInButton, up: false)
        return true
    }
    
    private func animateButton(_ button: UIButton, up: Bool) {
        let movementDistance: CGFloat = -260
        
        var movement: CGFloat = 0
        if up {
            movement = movementDistance
        } else {
            movement = -movementDistance
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [.beginFromCurrentState]) {
            button.frame = button.frame.offsetBy(dx: 0, dy: movement)
        }
    }
    
}

//MARK: - SetupUI
extension AuthViewController {
    
    private func setupUI() {
        tokenTextField.autocorrectionType = .no
        tokenTextField.spellCheckingType = .no
        tokenTextField.layer.borderWidth = 1
        tokenTextField.layer.cornerRadius = 8
        tokenTextField.layer.borderColor = UIColor(red: 0.129, green: 0.149, blue: 0.176, alpha: 1).cgColor
        invalidTokenLabel.isHidden = true
    }
}


