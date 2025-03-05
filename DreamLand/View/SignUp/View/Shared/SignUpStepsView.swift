import SwiftUI

struct SignUpStepsView: View {
    @Binding var stepReached: SignUpStep
    @Namespace private var animationNamespace
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                getStepView(for: .second)
                getStepView(for: .third)
                getStepView(for: .final)
            }
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
}
