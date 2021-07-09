//
//  DataProvider.swift
//  PortfolioWidgetExtension
//
//  Created by Thom Pheijffer on 01/07/2021.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    typealias Entry = SimpleEntry

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), items: [Item.example])
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        print("Get snapshot")
        let entry = SimpleEntry(date: Date(), items: loadItems())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        print("Get timeline")
        let entry = SimpleEntry(date: Date(), items: loadItems())
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }

    func loadItems() -> [Item] {
        let groupID = "group.thom.pheijffer.UltimatePortfolio"
        if let url = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupID) {
            print("Container location url: \(url.appendingPathComponent("Main.sqlite"))")
        }
        print("Load items reached")
        let dataController = DataController()
        let itemRequest = dataController.fetchRequestForTopItems(count: 5)
        print(dataController.results(for: itemRequest))
        return dataController.results(for: itemRequest)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let items: [Item]
}
