//
//  CameraPicker.swift
//  JansunwAI
//
//  Created by Rohan Prakash on 30/04/25.
//


import SwiftUI
import UIKit

/// A SwiftUI wrapper for UIImagePickerController to capture photos from the camera.
struct CameraPicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    @Binding var image: UIImage?

    /// Create the UIKit picker and configure it for camera use.
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera                                // camera source :contentReference[oaicite:3]{index=3}
        picker.delegate = context.coordinator                      // set delegate :contentReference[oaicite:4]{index=4}
        return picker
    }

    /// No dynamic updates needed.
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    /// Coordinator to conform to UIImagePickerControllerDelegate & UINavigationControllerDelegate.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: CameraPicker
        init(_ parent: CameraPicker) { self.parent = parent }

        /// Called when the user captures or selects a photo.
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage                              // bind image back to SwiftUI state :contentReference[oaicite:5]{index=5}
            }
            parent.presentationMode.wrappedValue.dismiss()           // dismiss the picker :contentReference[oaicite:6]{index=6}
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()           // dismiss on cancel :contentReference[oaicite:7]{index=7}
        }
    }
}
