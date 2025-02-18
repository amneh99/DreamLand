//
//  SignUpStepsView.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 2/16/25.
//

import SwiftUI

struct SignUpStepsView: View {
    @State var stepReached: SignUpStep = .first
    
    var body: some View {
        HStack(spacing: 0) {
            getFirstStep()
            getSecondStep()
            getThirdStep()
        }
    }
    
    func getFirstStep() -> some View {
        Group {
            switch stepReached {
            case .first:
                unSelectedStep()
            default:
                selectedStep()
            }
        }
    }
    
    func getSecondStep() -> some View {
        Group {
            switch stepReached {
            case .first,.second:
                unSelectedStep()
            default:
                selectedStep()
            }
        }
    }
    
    func getThirdStep() -> some View {
        Group {
            switch stepReached {
            case .final:
                selectedStep(isFinal: true)
            default:
                unSelectedStep(isFinal: true)
            }
        }
    }
    
    func unSelectedStep(isFinal: Bool = false) -> some View {
        HStack(spacing: 0) {
            unSelectedCheckmark()
                .frame(width: 40, height: 40)
            
            if !isFinal {
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .foregroundStyle(.white)
                    .frame(height: 1)
            }
        }
    }
    
    func selectedStep(isFinal: Bool = false) -> some View {
        HStack(spacing: 0) {
            selectedCheckmark()
                .frame(width: 40, height: 40)
                .animation(.easeInOut, value: stepReached)
            
            if !isFinal {
                Rectangle()
                    .fill(.stepsPurple)
                    .frame(height: 2)
                    .transition(.slide)
                    .animation(.easeInOut, value: stepReached)
            }
        }
    }
    
    func unSelectedCheckmark() -> some View {
        Circle()
            .fill(Color.white)
            .overlay {
                Image(.checkMark)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                    .foregroundStyle(.gray)
            }
    }
    
    func selectedCheckmark() -> some View {
        Circle()
            .fill(Color.stepsPurple)
            .overlay {
                Image(.checkMark)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                    .foregroundStyle(.white)
            }
    }
}

enum SignUpStep {
    case first, second, third ,final
}

#Preview {
    SignUpStepsView()
        .padding()
        .withBackground()
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}
