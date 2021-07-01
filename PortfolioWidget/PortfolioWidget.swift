//
//  PortfolioWidget.swift
//  PortfolioWidget
//
//  Created by Thom Pheijffer on 30/06/2021.
//

import WidgetKit
import SwiftUI

@main
struct PortfolioWidgets: WidgetBundle {
    var body: some Widget {
        SimplePortfolioWidget()
        ComplexPortfolioWidget()
    }
}
