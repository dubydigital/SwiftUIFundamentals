//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Mark Dubouzet on 1/9/25.
//

import Foundation
import SwiftUI

final class FrameworkGridViewModel: ObservableObject {

              
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())
    ]
    
}
