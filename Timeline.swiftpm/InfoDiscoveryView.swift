//
//  InfoDiscoveryView.swift
//  WWDC-2022
//
//  Created by Larissa Gomes de Stefano Escaliante on 22/04/22.
//
import SwiftUI

struct InfoDiscoveryView: View {
    @Binding var discovery: ScientificDiscovery
    @Binding var isActive: Bool
    @Binding var soundController: SoundController
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.8)
            
            VStack {
                HStack {
                    VStack {
                        HStack {
                            Text("\(discovery.id)/5 - \(discovery.scientistName)")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .padding(.leading, 20)
                            Spacer()
                        }
                        Spacer()
                        Image(discovery.scientistImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400, height: 400)
                        Spacer()
                    }.padding(.top, 50)
                    
                    VStack {
                        Spacer()
                        Image(discovery.discoveryImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .padding(.bottom, 20)
                        Text(discovery.discoveryName)
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 15)
                        Text(discovery.discoveryText)
                            .font(.system(size: 21))
                            .foregroundColor(.white)
                            .lineSpacing(7)
                    } .padding(.trailing, 30)
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        soundController.playButtonSound()
                        isActive = false
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
            .padding(40)
        }
    }
}
