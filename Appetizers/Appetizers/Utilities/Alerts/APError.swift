//
//  APError.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/13/26.
//

import Foundation

enum APError: Error {
    case invalidURL //
    case invalidResponse  // 404
    case invalidData  // can't parse
    case unableToComplete //
}
