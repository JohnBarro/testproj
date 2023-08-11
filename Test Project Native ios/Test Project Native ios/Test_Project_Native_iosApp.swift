//
//  Test_Project_Native_iosApp.swift
//  Test Project Native ios
//
//  Created by John Nemesio Barro on 8/11/23.
//

import SwiftUI

@main
struct Test_Project_Native_iosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
