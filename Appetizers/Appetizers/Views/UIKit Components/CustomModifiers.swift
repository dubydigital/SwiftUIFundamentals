//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/27/26.
//

import Foundation
import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
 
extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
