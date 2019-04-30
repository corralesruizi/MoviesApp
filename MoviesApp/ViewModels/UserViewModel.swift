//
//  File.swift
//  MoviesApp
//
//  Created by Developer on 4/30/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation

class UserViewModel
{
    var user = User()
    func signIn(usernme: String?, password: String?){
        print("username: \(usernme!) password: \(password!)")
    }
}
