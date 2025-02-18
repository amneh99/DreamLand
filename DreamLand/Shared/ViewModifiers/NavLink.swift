//
//  NavLink.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 2/16/25.
//

import SwiftUI

extension View {
    func navLink<Destination: View>(title: String, destination: Destination) -> some View {
        NavigationLink(destination: destination) {
            self
                .overlay(
                    Text(title)
                        .foregroundColor(.blue)
                )
        }
    }
}
