//
//  ImagePickerView.swift
//  swiftuicomponents
//
//  Created by m1_air on 5/10/24.
//

import Foundation
import SwiftUI
import PhotosUI


struct ImagePickerView: View {
    @State private var profile: Bool = false
    @State private var selectToggle: Bool = true
    @State private var selectedImage: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil

    
    var body: some View {
        ZStack {
            VStack {
              
                if let selectedImageData,
                   let uiImage = UIImage(data: selectedImageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 350)
                   
                }
                Spacer()
                if (selectToggle) {
                    PhotosPicker(
                        selection: $selectedImage,
                        matching: .images,
                        photoLibrary: .shared()
                    ) {
                        Image(systemName: "camera.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    .onChange(of: selectedImage, perform: {
                        newItem in
                        Task {
                            // Retrieve selected asset in the form of Data
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                selectedImageData = data
                                selectToggle = false
                            }
                        }
                    })
                    
                } else {
                    VStack {
                        HStack {
                            Button(action: {
                                selectToggle = true
                            }, label: { Text("Cancel")})
                            Button(action: {
                                let uiImage = UIImage(data: selectedImageData!)
                            }, label: {
                                Text("Save")
                            })
                        }
                    }
                }
                        
            }
        }.onAppear {
        }
    }
}

#Preview {
    ImagePickerView()
}
