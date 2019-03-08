//
//  UserViewController.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 3/8/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var loginView: LoginView!
    
    private var usersession: UserSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        usersession = (UIApplication.shared.delegate as! AppDelegate).usersession
        usersession.userSessionAccountDelegate = self
        usersession.usersessionSignInDelegate = self
    }
}

extension LoginViewController: LoginViewDelegate {
    func didSelectLoginButton(_ loginView: LoginView, accountLoginState: AccountLoginState) {
        guard let email = loginView.emailTextField.text,
            let password = loginView.passwordTextFiled.text,
            !email.isEmpty,
            !password.isEmpty else {
                showAlert(title: "Missing Required Fields", message: "Email and Password Required", actionTitle: "Try Again")
                return
        }
        switch accountLoginState {
        case .newAccount:
            usersession.createNewAccount(email: email, password: password)
        case .existingAccount:
            usersession.signInExistingUser(email: email, password: password)
        }
    }
}

extension LoginViewController: UserSessionAccountCreationDelegate {
    func didCreateAccount(_ userSession: UserSession, user: User) {
        showAlert(title: "Account Created", message: "Account created using \(user.email ?? "no email entered") ", style: .alert) { (alert) in
            self.presentMainTabController()
        }
    }
    
    func didRecieveErrorCreatingAccount(_ userSession: UserSession, error: Error) {
        showAlert(title: "Account Creation Error", message: error.localizedDescription, actionTitle: "Try Again")
    }
}

extension LoginViewController: UserSessionSignInDelegate {
    func didRecieveSignInError(_ usersession: UserSession, error: Error) {
        showAlert(title: "Sign In Error", message: error.localizedDescription, actionTitle: "Try Again")
    }
    
    func didSignInExistingUser(_ usersession: UserSession, user: User) {
        self.presentMainTabController()
    }
    
    private func presentMainTabController() {
        let storyboard = UIStoryboard(name: "MainTabBar", bundle: nil)
        let mainTabController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBar
        mainTabController.modalTransitionStyle = .crossDissolve
        mainTabController.modalPresentationStyle = .overFullScreen
        self.present(mainTabController, animated: true)
    }
}
