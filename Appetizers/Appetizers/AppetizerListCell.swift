//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/13/26.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 128, height: 85.1)
                .cornerRadius(12)
            
//            Image("sample_img")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 128, height: 85.1)
//                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .bold().fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .font(.title2).foregroundColor(Color.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
