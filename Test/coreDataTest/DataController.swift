//
//  DataController.swift
//  Test
//
//  Created by Prerana on 13/01/23.
//

import CoreData
import Foundation


class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "Model")
    
    init(){
        container.loadPersistentStores {description, error in
            if let error = error{
                print("core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
