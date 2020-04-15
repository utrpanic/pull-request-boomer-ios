//
//  AuthService.swift
//  Model
//
//  Created by box-jeon-mac-mini on 2020/01/19.
//  Copyright © 2020 utrpanic. All rights reserved.
//

import Foundation

protocol AuthAPI {
    
}

class AuthService {
    
    var API: AuthAPI
    
    init(API: AuthAPI) {
        self.API = API
    }
}
