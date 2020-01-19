//
//  LoginView.swift
//  PullRequestBoomer
//
//  Created by box-jeon-mac-mini on 2020/01/19.
//  Copyright © 2020 utrpanic. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        Text("First View")
            .font(.title)
            .tabItem {
                VStack {
                    Image("first")
                    Text("First")
                }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
