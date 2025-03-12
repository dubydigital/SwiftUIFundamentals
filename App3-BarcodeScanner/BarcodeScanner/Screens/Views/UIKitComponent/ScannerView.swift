//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Mark Dubouzet on 1/27/25.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {

    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    // ScannerVC Deleate
    //context: UIViewControllerRepresentableContext<ScannerView>
    func makeUIViewController(context:Context ) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
        //
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
        
    final class Coordinator: NSObject, ScannerVCDelegate {
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            //
            print(barcode)
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            print(error)
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedVlaue:
                scannerView.alertItem = AlertContext.invalidScannedType
            }
        }
                
    }
 
}

#Preview {
    ScannerView(scannedCode: .constant("1234"), alertItem: .constant(AlertItem(title: "Invalid Device Input",
                                                                               message: "Somethingis  wronge with the camera. We are unable to capture the input.",
                                                                               dimissButton: .default(Text("OK")))))
}
