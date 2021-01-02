//
//  UltimatePortfolioApp.swift
//  UltimatePortfolio
//
//  Created by Thom Pheijffer on 22/10/2020.
//

import SwiftUI

@main
struct UltimatePortfolioApp: App {
    @StateObject var dataController: DataController

    init() {
        let dataController = DataController(inMemory: false)
        _dataController = StateObject(wrappedValue: dataController)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: save)
        }
    }

    func save(_ note: Notification) {
        dataController.save()
    }
}
