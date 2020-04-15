//
//  NetworkAPI+Auth.swift
//  Model
//
//  Created by box-jeon-mac-mini on 2020/01/19.
//  Copyright © 2020 utrpanic. All rights reserved.
//

import Foundation

extension NetworkAPI: AuthAPI {
    
    func login() {
        let URL = "https://github.com/login/oauth/authorize"
        self.get(URL, showLog: true)
    }
}
