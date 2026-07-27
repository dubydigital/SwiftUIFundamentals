//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/23/26.
//

import SwiftUI

struct AppetizerDetailView: View {
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetail:Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .frame(width:300, height: 225)
                .aspectRatio(contentMode: .fill)
            
            VStack {
                // Title
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                // Description
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                // Calories
                HStack(spacing: 40) {
                    // Carbs
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    // Carbs
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    // Protein
                    NutritionInfo(title: "Protien", value: appetizer.protein)
                }
            }
            Spacer()
            // Button
            Button {
                print("Add to order tapped")
                order.add(appetizer)
                self.isShowingDetail = false
                // or via append order.items.append(appetizer)
            } label: {
                // Add To Order button using Buttons:
//                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
                // Text or use Text with modifier StandardButtonStyle
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
//            .modifier(StandardButtonStyle())
            .standardButtonStyle()
            .padding(.bottom,30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay( Button {
            print("Detail Dismiss")
            self.isShowingDetail = false
        } label:{
            XDismissButton()
        }.padding(5) , alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(false))
}

// MARK: - Nutritoin Info
struct NutritionInfo: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5){
            Text(title)
                .bold()
                .font(.caption)
            Text("\(value)" )
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
