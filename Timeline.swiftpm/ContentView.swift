import SwiftUI

struct ContentView: View {
    @State var isGameHappening = false
    @State var introHasFinished = false
    @State var gameHasFinished = false
    @State var soundControllerButton = SoundController()
    
    let soundControllerMusic = SoundController()
    
    var body: some View {
        if !isGameHappening {
            ZStack {
                Color(red: 78 / 255, green: 19 / 255, blue: 34 / 255)
                    .ignoresSafeArea()
                VStack {
                    Text("Click to start the mission")
                        .foregroundColor(Color.white.opacity(0.5))
                        .font(.system(size: 25))
                        .padding(40)
                    Spacer()
                    Image("initial-screen-figure")
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                }
            }
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .global)
                    .onEnded { _ in
                        soundControllerButton.playButtonSound()
                        self.isGameHappening = true
                    }
                )
            .onAppear() {
                soundControllerMusic.playMusic()
            }
        } else if !introHasFinished {
            IntroView(hasFinished: $introHasFinished, soundController: $soundControllerButton)
        } else if !gameHasFinished {
            GameView(hasEnded: $gameHasFinished, soundController: $soundControllerButton)
        } else {
            EndingView(isGameHappening: $isGameHappening, introHasFinished: $introHasFinished, gameHasFinished: $gameHasFinished, soundController: $soundControllerButton)
        }
    }
}
