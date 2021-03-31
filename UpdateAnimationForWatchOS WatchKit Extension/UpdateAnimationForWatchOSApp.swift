//
//  UpdateAnimationForWatchOSApp.swift
//  UpdateAnimationForWatchOS WatchKit Extension
//
//  Created by Ramill Ibragimov on 31.03.2021.
//

import SwiftUI

@main
struct UpdateAnimationForWatchOSApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
