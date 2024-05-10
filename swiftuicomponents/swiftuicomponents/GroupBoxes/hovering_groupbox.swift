//
//  hovering_groupbox.swift
//  swiftuicomponents
//
//  Created by m1_air on 5/10/24.
//

import Foundation
import SwiftUI

struct HoverGroupBox: View {
    var body: some View {
        GroupBox(
            label: Label("Label Text", systemImage: "hands.and.sparkles"),
            content: {
            VStack{
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(Color(.black))
                Text("Hello World!")
                    
            }
        })
        .padding()
            .shadow(color: .gray.opacity(0.2), radius: 10, x: 15, y: 15)
    }
}


