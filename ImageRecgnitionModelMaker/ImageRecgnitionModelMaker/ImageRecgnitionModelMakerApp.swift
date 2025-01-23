//
//  ImageRecgnitionModelMakerApp.swift
//  ImageRecgnitionModelMaker
//
//  Created by Prajot Awale on 29/10/24.
//

import SwiftUI

@main
struct ImageRecgnitionModelMakerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
