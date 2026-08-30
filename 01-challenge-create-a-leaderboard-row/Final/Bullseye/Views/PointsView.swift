import SwiftUI

struct PointsView: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game

  var body: some View {
    let roundedValue = Int(sliderValue.rounded())
    let points = game.points(sliderValue: roundedValue)
    VStack(spacing: 10) {
      InstructionText(text: "The slider's value is")
      BigNumberText(text: String(roundedValue))
      BodyText(text: "You scored \(points) Points\n 😻😻😻")
      Button {
        withAnimation {
          alertIsVisible = false
        }
        game.startNewRound(points: points)
      } label: {
        ButtonText(text: "Start New Round")
      }
    }
    .padding()
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(Constants.General.roundRectCornerRadius)
    .shadow(radius: 10, x: 5, y: 5)
  }
}

#Preview {
  @Previewable @State var alertIsVisible = true
  @Previewable @State var game = Game()
  PointsView(alertIsVisible: $alertIsVisible, sliderValue: .constant(50.0), game: $game)
}

#Preview("Dark Mode", traits: .landscapeRight) {
  @Previewable @State var alertIsVisible = true
  @Previewable @State var game = Game()
  PointsView(alertIsVisible: $alertIsVisible, sliderValue: .constant(50.0), game: $game)
    .preferredColorScheme(.dark)
}
