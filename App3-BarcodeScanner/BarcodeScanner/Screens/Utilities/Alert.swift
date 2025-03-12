//
//  Alert.swift
//  BarcodeScanner
//
//  Created by Mark Dubouzet on 1/30/25.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dimissButton: Alert.Button
}
 
struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                              message: "Somethingis wronge with the camera. We are unable to capture the input.",
                                              dimissButton: .default(Text("OK")))
    static let invalidScannedType = AlertItem(title: "Invalid Device Input",
                                              message: "The value scanned is not valid. This app scans EAN-8 and EAN-13",
                                              dimissButton: .default(Text("OK")))
}
