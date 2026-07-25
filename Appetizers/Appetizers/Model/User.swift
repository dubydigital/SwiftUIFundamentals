//
//  User.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/25/26.
//

import Foundation
import SwiftUI
internal import Combine

struct User: Codable {
    
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefils = false
}
