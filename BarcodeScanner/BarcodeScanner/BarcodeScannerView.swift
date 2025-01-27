//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Mark Dubouzet on 1/27/25.
//

import SwiftUI

struct BarcodeScannerView: View {
    var body: some View {
        NavigationView {
            VStack {
//                Rectangle()
//                    .frame(maxWidth: .infinity, maxHeight: 300)
                ScannerView()
                .frame(maxWidth: .infinity, maxHeight: 300)

                Spacer().frame(height:60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text("Not Yet Scanned")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
            }
        }
        .navigationTitle("Barcode Scanner")
    }
}

#Preview {
    BarcodeScannerView()
}
