//
//  Item-CoreDataHelpers.swift
//  UltimatePortfolio
//
//  Created by Thom Pheijffer on 24/10/2020.
//

import Foundation

extension Item {
    enum SortOrder {
        case optimized, title, creationDate
    }

    var itemTitle: String {
        title ?? NSLocalizedString("New Item", comment: "Create a new item")
    }

    var itemDetail: String {
        detail ?? ""
    }

    var itemCreationDate: Date {
        creationDate ?? Date()
    }

    static var example: Item = {
        let controller = DataController.preview
        let viewContext = controller.container.viewContext

        let item = Item(context: viewContext)
        item.title = "Example title"
        item.detail = "This is a example title"
        item.priority = 3
        item.creationDate = Date()

        return item
    }()
}
