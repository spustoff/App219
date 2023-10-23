//
//  App219App.swift
//  App219
//
//  Created by IGOR on 16/10/2023.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_ZhJwcb1qF9N54BwVcRXCTJJzzP4cmg")
        Amplitude.instance().initializeApiKey("fc5979fa364a8ea7fd024407fc064340")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App219App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
