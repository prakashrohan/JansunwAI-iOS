//
//  LoginFormView.swift
//  JansunwAI
//
//  Created by Rohan Prakash on 29/04/25.
//

import SwiftUI

struct LoginFormView: View {
    @Binding var isPresented: Bool

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var selectedDept: String = ""
    @State private var navigateToDashboard = false

    private let departments = [
        "Financial Services (Banking Division)",
        "Telecommunications",
        "Labour and Employment",
        "Central Board of Direct Taxes (Income Tax)",
        "Posts",
        "Personnel and Training",
        "Housing and Urban Affairs",
        "Health & Family Welfare"
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 32) {
                    // App logo/title
                    VStack(spacing: 8) {
                        Image(systemName: "shield.checkerboard")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.linearGradient(
                                colors: [Color.blue, Color.purple],
                                startPoint: .top,
                                endPoint: .bottom
                            ))
                        Text("JansunwAI")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                    }
                    .padding(.top, 40)

                    // Input card
                    VStack(spacing: 20) {
                        // Email field with icon
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundColor(.secondary)
                            TextField("Email", text: $email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)

                        // Password field with icon
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.secondary)
                            SecureField("Password", text: $password)
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)

                        // Department picker
                        Menu {
                            ForEach(departments, id: \.self) { dept in
                                Button(dept) { selectedDept = dept }
                            }
                        } label: {
                            HStack {
                                Image(systemName: "building.2")
                                    .foregroundColor(.secondary)
                                Text(selectedDept.isEmpty ? "Select Department" : selectedDept)
                                    .foregroundColor(selectedDept.isEmpty ? .secondary : .primary)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.secondary)
                            }
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(12)
                        }
                    }
                    .padding()
                    .background(.regularMaterial)
                    .cornerRadius(24)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                    .padding(.horizontal, 24)

                    // Submit button
                    Button {
                        navigateToDashboard.toggle()
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                Group {
                                    if email.isEmpty || password.isEmpty || selectedDept.isEmpty {
                                        Color.gray.opacity(0.4)
                                    } else {
                                        Color.blue.opacity(0.8)
                                    }
                                }
                            )
                            .foregroundColor(.white)
                            .cornerRadius(30)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
                    }
                    .disabled(email.isEmpty || password.isEmpty || selectedDept.isEmpty)
                    .padding(.horizontal, 24)

                    Spacer()
                }

                // NavigationLink for programmatic navigation
                NavigationLink(
                    destination: HomeView(),
                    isActive: $navigateToDashboard
                ) {
                    EmptyView()
                }
            }
        }
     
    }
}

struct LoginFormView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFormView(isPresented: .constant(true))
    }
}
