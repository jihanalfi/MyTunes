//
//  MyTunesApp.swift
//  MyTunes
//
//  Created by Jihan Alfiyyah Munajat on 18/01/24.
//

import SwiftUI

@main
struct MyTunesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            PageView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
