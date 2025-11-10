// ItemStore.swift

import UIKit

class ItemStore {

    
    var allItems = [Item]() 
    var expensiveItems = [Item]() // For items > $50
    var cheapItems = [Item]()     // For items <= $50
    
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        // Append to the correct section array
        if newItem.valueInDollars > 50 {
            expensiveItems.append(newItem)
        } else {
            cheapItems.append(newItem)
        }
        
        

        return newItem
    }
    
    
    func removeItem(item: Item) {
        // Check and remove from the expensive array first
        if let index = expensiveItems.firstIndex(of: item) {
            expensiveItems.remove(at: index)
        }
        // If not found in expensive, check and remove from the cheap array
        else if let index = cheapItems.firstIndex(of: item) {
            cheapItems.remove(at: index)
        }
        
    }
    
    
    func item(for section: Int) -> [Item] {
        return section == 0 ? expensiveItems : cheapItems
    }
    
    
    func moveItem(from sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove: Item

        // 1. Get the item and remove it from the source array
        if sourceIndexPath.section == 0 {
            itemToMove = expensiveItems[sourceIndexPath.row]
            expensiveItems.remove(at: sourceIndexPath.row)
        } else {
            itemToMove = cheapItems[sourceIndexPath.row]
            cheapItems.remove(at: sourceIndexPath.row)
        }

        // 2. Insert the item into the destination array
        if destinationIndexPath.section == 0 {
            expensiveItems.insert(itemToMove, at: destinationIndexPath.row)
        } else {
            cheapItems.insert(itemToMove, at: destinationIndexPath.row)
        }
    }
}
