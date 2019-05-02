//
//  LoginViewController.swift
//  MoviesApp
//
//  Created by Developer on 4/30/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    var userVM = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnLoginAction(_ sender: UIButton) {
        userVM.signIn(usernme: txtUsername.text, password: txtPassword.text)
    }
}
