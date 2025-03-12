//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Mark Dubouzet on 1/27/25.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    // Initialize new BarcodeScannerViewModel
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {

                ZStack {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                    ScannerView(scannedCode: $viewModel.scannedCode,
                                alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    
                }
                
                Spacer().frame(height:60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(viewModel.statusTextColor)
                    .padding()
            }
        }
        .navigationTitle("Barcode Scanner")
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: Text(alertItem.title),
                  message: Text(alertItem.message),
                  dismissButton: alertItem.dimissButton)
        }
        
    }
}

#Preview {
    BarcodeScannerView()
}
