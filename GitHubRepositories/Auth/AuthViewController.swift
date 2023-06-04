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
    @IBOutlet weak var buttonConstraint: NSLayoutConstraint!
    
    //MARK: - Initial
    override func viewDidLoad() {
        super.viewDidLoad()
        tokenTextField.delegate = self
        keyboardNotifications()
        setupUI()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func signInTapped(_ sender: UIButton) {
        let vc = RepositoriesListViewController()
        navigationController?.pushViewController(vc, animated: true)
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

    
}

//MARK: - KeyboardNotifications
extension AuthViewController {
    
    private func keyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        tokenTextField.layer.borderColor = UIColor(
            red: 0.345, green: 0.651, blue: 1, alpha: 1
        ).cgColor
        
        let userInfo = notification.userInfo
        if let keyboardSize = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardSize.cgRectValue.height
            buttonConstraint.constant = 30 + keyboardHeight
            let animationDuration = userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.3
            UIView.animate(withDuration: animationDuration) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        tokenTextField.layer.borderColor = UIColor(
            red: 0.129, green: 0.149, blue: 0.176, alpha: 1
        ).cgColor
        buttonConstraint.constant = 50
        let userInfo = notification.userInfo
        let animationDuration = userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.3
        UIView.animate(withDuration: animationDuration) {
            self.view.layoutIfNeeded()
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
