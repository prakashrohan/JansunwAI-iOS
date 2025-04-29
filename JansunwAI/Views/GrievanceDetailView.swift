//
//  GrievanceDetailView.swift
//  JansunwAI
//
//  Created by Rohan Prakash on 17/04/25.
//

import SwiftUI
import CoreLocation

struct GrievanceDetailView: View {
    let grievance: Grievance
    @State private var showReportView = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Title
                Text(grievance.title)
                    .foregroundStyle(Color.black)
                    .font(.title2.weight(.bold))
                   

                // Status badge
                Text(grievance.status)
                    .font(.subheadline.weight(.semibold))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(color(for: grievance.status).opacity(0.2))
                    )
                    .foregroundColor(color(for: grievance.status))

                // Description card
                Text(grievance.description)
                    .font(.body)
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)

                // Location
                if let location = grievance.location {
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        Text("Latitude: \(location.latitude), Longitude: \(location.longitude)")
                    }
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.top, 8)
                }

                // Create Report Button
                Button {
                    showReportView = true
                } label: {
                    Text("Create Report")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            Color.blue.opacity(0.8)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
                }
                .padding(.top, 20)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(16)
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showReportView) {
            ReportView(grievance: grievance)
        }
    }

    // Reuse color logic
    func color(for status: String) -> Color {
        switch status {
        case "Resolved": return .green
        case "In Progress": return .orange
        default: return .red
        }
    }
}
