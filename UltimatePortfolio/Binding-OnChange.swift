//
//  Binding-OnChange.swift
//  UltimatePortfolio
//
//  Created by Thom Pheijffer on 18/11/2020.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
    }
}
