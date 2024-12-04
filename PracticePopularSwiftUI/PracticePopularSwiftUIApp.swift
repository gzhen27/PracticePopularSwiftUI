//
//  PracticePopularSwiftUIApp.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/23/24.
//

import SwiftUI
import SwiftfulRouting

@main
struct PracticePopularSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
        }
    }
}


extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
