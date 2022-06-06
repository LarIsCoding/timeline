//
//  Timeline.swift
//  WWDC-2022
//
//  Created by Larissa Gomes de Stefano Escaliante on 21/04/22.
//
import SwiftUI

struct Timeline: View {
    @Binding var cards: [ScientificDiscovery]
    @Binding var isInRange: Bool
    @Binding var dragPosX: CGFloat
    @Binding var dragRelativePos: Int
    
    var screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        HStack() {
            ForEach(0 ..< cards.count, id: \.self) { index in
                ForEach(0 ..< getSpacerWidth(index), id: \.self) { _ in
                    Spacer()
                }
                CardView(discovery: $cards[index])
                    .zIndex(0)
            }
            .onChange(of: dragPosX) { _ in
                dragRelativePos = getRelativePos()
            }

            ForEach(0 ..< getSpacerWidth(cards.count), id: \.self) { _ in
                Spacer()
            }
        }
    }
    
    func getRelativePos() -> Int {
        let distanceBetweenItems = screenWidth / CGFloat(cards.count + 1)
        return Int((dragPosX + screenWidth / 2) / distanceBetweenItems)
    }
    
    func getSpacerWidth(_ index: Int) -> Int {
        if index == dragRelativePos && isInRange {
            return 3
        }
        return 1
    }
}
