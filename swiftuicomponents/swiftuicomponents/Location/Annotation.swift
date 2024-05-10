//
//  Annotation.swift
//  swiftuicomponents
//
//  Created by m1_air on 5/10/24.
//

import Foundation
import SwiftUI
import MapKit

struct IdentifiableLocation: Identifiable {
    let id: UUID
    let name: String
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), name: String, lat: Double, long: Double) {
        self.id = id
        self.name = name
        self.location = CLLocationCoordinate2D(
            latitude: lat, longitude: long
        )
    }
}

struct LocationAnnotationView: View {
  var body: some View {
    VStack(spacing: 0) {
      Image(systemName: "mappin.circle.fill")
        .font(.title)
        .foregroundColor(.red)
      
      Image(systemName: "arrowtriangle.down.fill")
        .font(.caption)
        .foregroundColor(.red)
        .offset(x: 0, y: -5)
    }
  }
}
