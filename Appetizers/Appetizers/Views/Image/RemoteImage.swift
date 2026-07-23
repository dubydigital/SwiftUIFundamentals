//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/22/26.
//

import SwiftUI
internal import Combine

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String ) {
        
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage = uiImage else {
                return
            }
            // Main thread to trigger UI
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

// Placeholder Image
struct RemoteImage: View {
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image("DPL_Logo")
    }
}

// Use in our ListView
struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        // Remote Image
        RemoteImage(image: imageLoader.image)
            .onAppear {
                // On Appear, load
                imageLoader.load(fromURLString: urlString)
            }
    }
}
