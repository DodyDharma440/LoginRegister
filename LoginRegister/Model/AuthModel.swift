//
//  AuthModel.swift
//  LoginRegister
//
//  Created by Dodi Aditya on 18/05/23.
//

import SwiftUI

struct AuthModel: Codable {
    let uid: String
    let email: String
    let image: URL?
    let displayName: String?
}
