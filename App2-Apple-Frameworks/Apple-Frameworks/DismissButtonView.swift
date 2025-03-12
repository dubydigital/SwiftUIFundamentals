//
//  DismissButtonView.swift
//  Apple-Frameworks
//
//  Created by Mark Dubouzet on 1/13/25.
//

import SwiftUI

struct DismissButtonView: View {
    
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        HStack() {
            Spacer()
            Button {
                isShowingDetailView = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
//            .padding()
        }
    }
}

#Preview {
    DismissButtonView(isShowingDetailView: Binding.constant(false))
}
