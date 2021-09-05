//
//  FirstAppear.swift
//  NewsDemoApp
//
//  Created by Nilaakash Singh on 05/09/21.
//

import SwiftUI

// MARK: - On First Appear Modifier
private struct onFirstAppearModifier: ViewModifier {
    // MARK: - Variables
    let perform: () -> Void
    @State private var firstTime = true
    
    // MARK: - Body
    func body(content: Content) -> some View {
        content.onAppear {
            if firstTime {
                firstTime = false
                perform()
            }
        }
    }
}

// MARK: - View Extension
extension View {
    func onFirstAppear(perform: @escaping () -> Void) -> some View {
        modifier(onFirstAppearModifier(perform: perform))
    }
}
