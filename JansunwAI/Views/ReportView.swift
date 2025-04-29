import SwiftUI
import CoreLocation
import PhotosUI
import Lottie

struct ReportView: View {
    let grievance: Grievance

    @State private var remarks: String = ""
    @State private var status: String
    @Environment(\.dismiss) private var dismiss

    @State private var showSuccess = false


    init(grievance: Grievance) {
        self.grievance = grievance
        _status = State(initialValue: grievance.status)
    }


    // Multi-image picker state
    @State private var photoItems: [PhotosPickerItem] = []
    @State private var images: [UIImage] = []

    // Camera capture state
    @State private var showCameraPicker: Bool = false

    @StateObject private var locationManager = LocationManager()

    // 3 flexible columns for a 3×2 grid
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 3)

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Remarks")) {
                    TextEditor(text: $remarks)
                        .frame(height: 100)
                }

                Section(header: Text("Status")) {
                    Picker("Update Status", selection: $status) {
                        Text("Pending").tag("Pending")
                        Text("In Progress").tag("In Progress")
                        Text("Resolved").tag("Resolved")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Add Photos (up to 6)")) {
                    // Grid of selected images + placeholders
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(images, id: \.self) { img in
                            Image(uiImage: img)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 100)
                                .clipped()
                                .cornerRadius(6)
                        }
                        ForEach(images.count..<6, id: \.self) { _ in
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                    .frame(height: 100)
                                Image(systemName: "photo.on.rectangle.angled")
                            }
                        }
                    }
                    .padding(.vertical, 4)

                    HStack {
                        PhotosPicker(
                            selection: $photoItems,
                            maxSelectionCount: 6,
                            matching: .images,
                            photoLibrary: .shared()
                        ) {
                            Label("Select Photos", systemImage: "photo.on.rectangle")
                        }

                        Spacer()

                        Button {
                            guard images.count < 6 else { return }
                            showCameraPicker = true
                        } label: {
                            Label("Take Photo", systemImage: "camera")
                        }
                        .disabled(images.count >= 6)
                    }
                    .onChange(of: photoItems) { newItems in
                        images = []
                        for item in newItems {
                            Task {
                                if let data = try? await item.loadTransferable(type: Data.self),
                                   let uiImg = UIImage(data: data) {
                                    images.append(uiImg)
                                }
                            }
                        }
                    }
                }

                Section(header: Text("Location")) {
                    if let loc = locationManager.location {
                        Text("Lat: \(loc.latitude), Lon: \(loc.longitude)")
                        if let name = locationManager.placeName {
                            Text(name)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        } else {
                            Text("Getting place name...")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    } else if locationManager.locationStatus == .denied {
                        Text("Location access denied.")
                            .foregroundColor(.red)
                    } else {
                        Text("Getting location...")
                            .foregroundColor(.gray)
                    }
                }

            }
            
            .navigationTitle("Create Report")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Submit") {
                        submitReport()
                    }
                }
            }
            .sheet(isPresented: $showCameraPicker) {
                CameraPicker(image: Binding(
                    get: { nil },
                    set: { newImg in
                        if let img = newImg, images.count < 6 {
                            images.append(img)
                        }
                        showCameraPicker = false
                    }
                ))
            }
        }
        .overlay(
            Group {
                if showSuccess {
                    ZStack {
                        Color.black.opacity(0.5).ignoresSafeArea()
                        VStack {
                            LottieView(name: "tick", loopMode: .playOnce)
                                .frame(width: 150, height: 150)
                            Text("Report Submitted")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.top)
                        }
                    }
                }
            }
        )

        .onAppear {
            locationManager.requestLocation()
        }
    }

    private func submitReport() {
        
        let imageDatas = images.compactMap { $0.jpegData(compressionQuality: 0.8) }
        print("Submitting report:")
        print(" • Remarks: \(remarks)")
        print(" • Status: \(status)")
        print(" • \(imageDatas.count) images, total bytes: \(imageDatas.reduce(0){ $0 + $1.count })")
        if let loc = locationManager.location {
            print(" • Location: \(loc.latitude), \(loc.longitude)")
        }

       
        showSuccess = true

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            dismiss()
        }
    }

}





