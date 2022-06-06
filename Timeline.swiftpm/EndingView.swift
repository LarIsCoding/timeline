//
//  EndingView.swift
//  WWDC-2022
//
//  Created by Larissa Gomes de Stefano Escaliante on 24/04/22.
//

import SwiftUI

struct EndingView: View {
    @Binding var isGameHappening: Bool
    @Binding var introHasFinished: Bool
    @Binding var gameHasFinished: Bool
    @Binding var soundController: SoundController
    
    @State var dialog = """
        Wow, you really understand about science!
        Now I am ready to start the mission and change the history of these and many other women.
        See you soon in space-time, my friend!
        """
    
    var body: some View {
        ZStack {
            Color(red: 78 / 255, green: 19 / 255, blue: 34 / 255)
                .ignoresSafeArea()
            HStack {
                Spacer()
                VStack {
                    Image("background-end")
                        .resizable()
                        .scaledToFit()
                        .padding(.leading, 70)
                        .padding(.top, 30)
                    Spacer()
                }
            }
            VStack {
                Spacer()
                Image("sylvia-happy")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 700)
            }
            VStack {
                Spacer()
                ZStack {
                    Color.black
                        .opacity(0.8)
                        .ignoresSafeArea()
                    VStack {
                        HStack {
                            Text(dialog)
                                .foregroundColor(.white)
                                .font(.system(size: 23))
                                .lineSpacing(10)
                                .padding(25)
                            Spacer()
                        }
                        Spacer()
                    }
                }.frame(height: 200)
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        soundController.playButtonSound()
                        isGameHappening = false
                        introHasFinished = false
                        gameHasFinished = false
                    }) {
                        Text("Finish")
                            .fontWeight(.bold)
                            .font(.title2)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color(red: 229 / 255, green: 60 / 255, blue: 103 / 255))
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .padding(20)
                    }
                }
            }
        }
    }
}

