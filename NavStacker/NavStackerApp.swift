//
//  NavStackerApp.swift
//  NavStacker
//
//  Created by Andre Unsal on 10/1/22.
//

import SwiftUI

/**
 Both ContentView and ContentView2 test slightly different approaches to the
 Navigator Pattern. Feel free to test with either root view stack.
 */
@main
struct NavStackerApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
            ContentView2()
        }
    }
}
