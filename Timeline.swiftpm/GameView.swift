//
//  GameView.swift
//  WWDC-2022
//
//  Created by Larissa Gomes de Stefano Escaliante on 23/04/22.
//

import SwiftUI

struct GameView: View {
    @Binding var hasEnded: Bool
    @Binding var soundController: SoundController
    
    @State var dragAmount = CGSize.zero
    @State var isInRange = false
    @State var dragRelativePos = 0
    
    @State var draggableCard = ScientificDiscovery(id: 0, year: 0, discoveryName: "", discoveryImage: "", discoveryText: "", scientistName: "", scientistImage: "", cardImage: "")
    @State var cards = [ScientificDiscovery]()
    @State var mustShowInfo = true
    @State var completeCycle = false
    @State var hasEndedPrivate = false
    
    let game = GameController()
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .onAppear() {
                    draggableCard = game.getCurrentCard()
                }
            VStack {
                Image("quadro")
                    .resizable()
                    .scaledToFit()
                    .padding(20)
                    .padding(.bottom, 70)
                Spacer()
            }
            VStack() {
                Timeline(
                    cards: $cards,
                    isInRange: $isInRange,
                    dragPosX: $dragAmount.width,
                    dragRelativePos: $dragRelativePos
                )
                    .onChange(of: dragAmount) { _ in
                        isInRange = dragAmount.height < -200
                    }
                    .padding(.top, 100)
                Spacer()
                if game.turnStatus != .rightGuess {
                    CardView(discovery: $draggableCard)
                        .offset(dragAmount)
                        .zIndex(dragAmount == .zero ? 0 : 1)
                        .shadow(color: .yellow, radius: dragAmount.height > -150 ? 0 : 30)
                        .gesture(
                            DragGesture(coordinateSpace: .global)
                                .onChanged {
                                    self.dragAmount = CGSize(width: $0.translation.width, height: $0.translation.height)
                                }
                                .onEnded { _ in
                                    if isInRange {
                                        if isRightGuess() {
                                            soundController.playRightSound()
                                            updateScene()
                                        } else {
                                            soundController.playWrongSound()
                                            game.turnStatus = .wrongGuess
                                        }
                                    }
                                    self.dragAmount = .zero
                                }
                        )
                }
                Text(game.getText())
                    .foregroundColor(game.getColorText())
                    .fontWeight(.medium)
                    .font(.system(size: 23))
                    .padding(.top, 50)
                    .onReceive(timer) { _ in
                        if completeCycle {
                            if game.turnStatus == .rightGuess {
                                if !hasEndedPrivate {
                                    mustShowInfo = true
                                    game.turnStatus = .didNotGuess
                                } else {
                                    hasEnded = true
                                }
                            }
                        }
                        completeCycle = !completeCycle
            
                    }
            } .padding(50)
            if mustShowInfo {
                InfoDiscoveryView(discovery: $draggableCard, isActive: $mustShowInfo, soundController: $soundController)
            }
        }
    }
    
    func updateScene() {
        draggableCard.wasGuessed = true
        cards.insert(draggableCard, at: dragRelativePos)
        game.turnStatus = .rightGuess
        hasEndedPrivate = game.updateTurnAndCheckEnd()
        if !hasEndedPrivate {
            draggableCard = game.getNextDicovery()
        }
    }
    
    func isRightGuess() -> Bool {
        let leftYear = dragRelativePos == 0 ? 0 : cards[dragRelativePos - 1].year
        let rightYear = dragRelativePos == cards.count ? 2030 : cards[dragRelativePos].year
        return game.getCurrentCard().year > leftYear && game.getCurrentCard().year < rightYear
    }
}

