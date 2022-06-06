//
//  IntroView.swift
//  WWDC-2022
//
//  Created by Larissa Gomes de Stefano Escaliante on 23/04/22.
//

import SwiftUI

struct IntroView: View {
    @Binding var hasFinished: Bool
    @Binding var soundController: SoundController
    
    @State var dialog = ""
    @State var ilustration = ""
    
    var controller = IntroController()
    
    var body: some View {
        ZStack {
            Color(red: 78 / 255, green: 19 / 255, blue: 34 / 255)
                .ignoresSafeArea()
            HStack {
                Spacer()
                VStack {
                    Image("background")
                        .resizable()
                        .scaledToFit()
                        .padding(.leading, 70)
                        .padding(.top, 30)
                        .onAppear() {
                            dialog = controller.getDataCurrentFrame()
                            ilustration = controller.getSylviaIlustrationCurrentFrame()
                        }
                    Spacer()
                }
            }
            VStack {
                Spacer()
                Image(ilustration)
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
                        hasFinished = controller.updateFrameAndCheckEnded()
                        if !hasFinished {
                            dialog = controller.getDataCurrentFrame()
                            ilustration = controller.getSylviaIlustrationCurrentFrame()
                        }
                    }) {
                        Text("Next")
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
