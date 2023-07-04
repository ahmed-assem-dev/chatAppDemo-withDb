//
//  chatAppDemoApp.swift
//  chatAppDemo
//
//  Created by Assem on 04/07/2023.
//

import SwiftUI
import FirebaseCore

@main

struct chatAppDemoApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
