//  LaunchView.swift
//  JansunwAI
//
//  Created by Rohan Prakash on 29/04/25.
//

import SwiftUI

struct LaunchView: View {
    @State private var showLoginSheet = false

    var body: some View {
        ZStack {
            Image("launch-screen")
                //.resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Spacer()

                Button("Login") {
                    showLoginSheet = true
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 200)
                .padding()
                .background(Color.blue.opacity(0.85))
                .cornerRadius(12)
                .shadow(radius: 5)
                
            }
            .padding(.bottom, -16)
        }
        .fullScreenCover(isPresented: $showLoginSheet) {
            LoginFormView(isPresented: $showLoginSheet)
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}



