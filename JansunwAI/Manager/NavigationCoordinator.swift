//
//  NavigationCoordinator.swift
//  JansunwAI
//
//  Created by Rohan Prakash on 30/04/25.
//


// NavigationCoordinator.swift
import SwiftUI

class NavigationCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func popToRoot() {
        path.removeLast(path.count)
    }
}
