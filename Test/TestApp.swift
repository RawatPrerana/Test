//
//  TestApp.swift
//  Test
//
//  Created by Prerana on 22/11/22.
//

import SwiftUI

@main
struct TestApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            userNotification(sound: .default, sound2: .default)
//            SoundPlayer(sound: 1007)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
