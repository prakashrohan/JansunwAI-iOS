//
//  grievance 2.swift
//  JansunwAI
//
//  Created by Rohan Prakash on 30/04/25.
//

import Foundation

struct grievance: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let status: String
    let lastUpdated: Date
}
