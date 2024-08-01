//
//  OTTAppApp.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 09/07/24.
//

import SwiftUI

@main
struct OTTAppApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainContentView()
            
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
