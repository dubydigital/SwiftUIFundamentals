//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Mark Dubouzet on 1/27/25.
//

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

struct BarcodeScannerView: View {
    
    @State private var scannedCode = ""
    @State private var alertItem: AlertItem?
    
    
    var body: some View {
        NavigationView {
            VStack {
//                Rectangle()
//                    .frame(maxWidth: .infinity, maxHeight: 300)
                ScannerView(scannedCode: $scannedCode, alertItem: $alertItem)
                .frame(maxWidth: .infinity, maxHeight: 300)

                Spacer().frame(height:60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
                
 
            }
        }
        .navigationTitle("Barcode Scanner")
        .alert(item: $alertItem) { alertItem in
            Alert(title: Text(alertItem.title),
                  message: Text(alertItem.message),
                  dismissButton: alertItem.dimissButton)
        }
        
    }
}

#Preview {
    BarcodeScannerView()
}
