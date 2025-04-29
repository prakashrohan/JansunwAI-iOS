//
//  Grievance.swift
//  JansunwAI
//
//  Created by Rohan Prakash on 17/04/25.
//


import Foundation
import CoreLocation
import PhotosUI

struct Grievance: Identifiable {
    var id: UUID = UUID()
    var title: String
    var description: String
    var status: String
    var officerRemarks: String?
    var image: UIImage?
    var location: CLLocationCoordinate2D?
    var lastUpdated: Date
}
