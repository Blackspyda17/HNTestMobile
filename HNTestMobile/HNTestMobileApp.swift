//
//  HNTestMobileApp.swift
//  HNTestMobile
//
//  Created by Gilberth Paez Ortiz on 5/9/24.
//

import SwiftUI

@main
struct HNTestMobileApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
