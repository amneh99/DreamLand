import SwiftUI

struct SignUpStepsView: View {
    @Binding var stepReached: SignUpStep
    @State var stepReached1 = SignUpStep.first
    @Namespace private var animationNamespace
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                getStepView(for: .second)
                getStepView(for: .third)
                getStepView(for: .final)
            }
            
//            Button(action: {
//                withAnimation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.5)) {
//                    switch stepReached1 {
//                    case .first:
//                        stepReached1 = .second
//                    case .second:
//                        stepReached1 = .third
//                    case .third:
//                        stepReached1 = .final
//                    case .final:
//                        stepReached1 = .first
//                    }
//                }
//            }) {
//                Text("Next Step")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//            }
//            .padding(.top, 20)
        }
    }
    
    @ViewBuilder
    func getStepView(for step: SignUpStep) -> some View {
        HStack(spacing: 0) {
            if stepReached == step {
                Circle()
                    .fill(Color.stepsPurple)
                    .frame(width: 40, height: 40)
                    .overlay {
                        Image(.checkMark)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(.white)
                    }
                    .matchedGeometryEffect(id: "circle", in: animationNamespace)
                    .transition(.scale.combined(with: .offset(x: -40, y: 0)))
            } else {
                Circle()
                    .fill(step.rawValue <= stepReached.rawValue ? .stepsPurple : .gray)
                    .frame(width: 40, height: 40)
                    .overlay {
                        Image(.checkMark)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(.white)
                    }
            }
            
            if step != .final {
                Rectangle()
                    .fill(stepReached.rawValue > step.rawValue ? Color.stepsPurple : Color.gray)
                    .frame(height: 2)
            }
        }
    }
}

enum SignUpStep: Int, CaseIterable {
    case first = 1, second = 2, third = 3, final = 4
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}

#Preview {
    SignUpStepsView(stepReached: .constant(.first))
        .padding()
        .withBackground()
    
//    SignUpStepsViewPreview()
//        .padding()
//        .withBackground()
}

struct SignUpStepsViewPreview: View {
    @State var stepReached = SignUpStep.first
    
    var body: some View {
        VStack {
            SignUpStepsView(stepReached: $stepReached)
            
            Button {
                if stepReached == .first {
                    stepReached = .second
                } else if stepReached == .second {
                    stepReached = .third
                } else if stepReached == .third {
                    stepReached = .final
                }
            } label: {
                Text("Next")
            }

        }
    }
}
