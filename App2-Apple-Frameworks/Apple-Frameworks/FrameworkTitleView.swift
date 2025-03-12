//
//  FrameworkTitleView.swift
//  Apple-Frameworks
//
//  Created by Mark Dubouzet on 1/27/25.
//

import SwiftUI

struct FrameworkTitleView: View {
    let frameWork: Framework
    
    var body: some View {
        VStack {
            Image(frameWork.imageName)
                .resizable()
                .frame(width: 90, height: 90, alignment: .center)
            Text(frameWork.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}

#Preview {
    FrameworkTitleView(frameWork: MockData.sampleFramework)
}
