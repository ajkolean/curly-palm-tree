//
//  TodosApp.swift
//  Todos
//
//  Created by Andy Kolean on 12/7/21.
//

import SwiftUI

@main
struct TodosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
