//
//  Font.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 2/16/25.
//

import SwiftUI

enum FontWeight {
    case light(CGFloat)
    case regular(CGFloat)
    case medium(CGFloat)
    case bold(CGFloat)
    case black(CGFloat)
}

extension Font {
    static func customFont(_ fontWeight: FontWeight) -> Font {
        switch fontWeight {
        case .light(let size):
            return Font.custom("AvenirLTStd-Light", size: size)
        case .regular(let size):
            return Font.custom("AvenirLTStd-Book", size: size)
        case .medium(let size):
            return Font.custom("AvenirLTStd-Medium", size: size)
        case .bold(let size):
            return Font.custom("AvenirLTStd-Heavy", size: size)
        case .black(let size):
            return Font.custom("AvenirLTStd-Black", size: size)
        }
    }
}

extension View {
    func customFont(_ fontWeight: FontWeight) -> some View {
        return self.font(.customFont(fontWeight))
    }
}

