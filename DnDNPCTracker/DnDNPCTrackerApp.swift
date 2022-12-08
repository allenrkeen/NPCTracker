//
//  DnDNPCTrackerApp.swift
//  DnDNPCTracker
//
//  Created by Allen Keen on 12/4/22.
//

import SwiftUI

@main
struct DnDNPCTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
