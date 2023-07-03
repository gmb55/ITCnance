//
//  LoginViewModel.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 30/06/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    
    func handleLogin() {
        // Perform login logic here
    }
}
