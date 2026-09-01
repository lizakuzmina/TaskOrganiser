//
//  OraniserApp.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 06.06.2026.
//

import SwiftUI

@main
struct OraniserApp: App {
    
    let coordinator = Coordinator()
    
    var body: some Scene {
        WindowGroup {
            coordinator.taskListView
        }
    }
}
