//
//  circular_hovering_groupbox.swift
//  swiftuicomponents
//
//  Created by m1_air on 5/10/24.
//

import Foundation
import SwiftUI

struct CircularHoverGroupBox: View {
    var body: some View {
        GroupBox(
            label: Label("Label Text", systemImage: "hands.and.sparkles"),
            content: {
            VStack{
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(Color(.black))
                    
            }
        })
        .groupBoxStyle(CircularGroupBoxStyle())
        .padding()
            .shadow(color: .gray.opacity(0.2), radius: 10, x: 15, y: 15)
    }
}

struct CircularGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .center) {
            configuration.label
            configuration.content
        }
        .frame(width: 100, height: 100)
        .padding()
        .background(Color(.systemGroupedBackground))
        .clipShape(Circle())
    }
}
