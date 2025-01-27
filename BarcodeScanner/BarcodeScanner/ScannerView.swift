//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Mark Dubouzet on 1/27/25.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {

    

    // ScannerVC Deleate
    //context: UIViewControllerRepresentableContext<ScannerView>
    func makeUIViewController(context:Context ) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
        //
    }
    
  
    func makeCoordinator() -> Coordinator {
          Coordinator()
    }
        
    final class Coordinator: NSObject, ScannerVCDelegate {
        func didFind(barcode: String) {
            //
            print(barcode)
        }
        
        func didSurface(error: CameraError) {
            //
            print(error.rawValue)
        }
        
        
    }
 
}

#Preview {
    ScannerView()
}
