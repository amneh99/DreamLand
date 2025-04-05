//
//  Int.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 4/5/25.
//

import Foundation

extension Int {
    func formatDuration() -> String {
        let hours = self / 60
        let remainingMinutes = self % 60

        return "\(hours) h \(remainingMinutes) m"
    }
}
