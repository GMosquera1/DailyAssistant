//
//  ToDos.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 3/7/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation
final class ToDosModel {
    private static let filename = "ToDos.plist"
    private static var items = [ToDo]()
    
    static func getItems() -> [ToDo] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    items = try PropertyListDecoder().decode([ToDo].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            } else {
                print("data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        items = items.sorted { $0.date > $1.date }
        return items
    }
    
    static func addItem(item: ToDo) {
        items.append(item)
        save()
    }
    
    static func delete(item: ToDo, atIndex index: Int) {
        items.remove(at: index)
        save()
    }
    
    static func save() {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(items)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    
    static func updateItem(updatedItem: ToDo, atIndex index: Int) {
        items[index] = updatedItem
        save()
    }
}
