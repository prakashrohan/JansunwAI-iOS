//
//  LottieView.swift
//  JansunwAI
//
//  Created by Rohan Prakash on 30/04/25.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode = .playOnce

    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        let animationView = LottieAnimationView(name: name)
        animationView.loopMode = loopMode
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
