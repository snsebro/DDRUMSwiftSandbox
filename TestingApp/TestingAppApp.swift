//
//  TestingAppApp.swift
//  TestingApp
//
//  Created by Shayne Sebro on 12/4/23.
//

import SwiftUI
import DatadogCore
import DatadogCrashReporting
import DatadogRUM

@main
struct TestingAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let appID = "5a7e1cf2-22d0-4a84-a379-dd891583ced7"
        let clientToken = "pub0df7194c15a3a12cd87d4bd1a9ea46ee"
        let environment = "testing"

        Datadog.initialize(
            with: Datadog.Configuration(
                clientToken: clientToken,
                env: environment,
                site: .us1
            ),
            trackingConsent: .granted
        )
        
        CrashReporting.enable()

        RUM.enable(
            with: RUM.Configuration(
                applicationID: appID,
                uiKitViewsPredicate: DefaultUIKitRUMViewsPredicate(),
                uiKitActionsPredicate: DefaultUIKitRUMActionsPredicate()
            )
        )
        return true
    }
}
