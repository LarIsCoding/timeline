//
//  DiscoveryView.swift
//  WWDC-2022
//
//  Created by Larissa Gomes de Stefano Escaliante on 20/04/22.
//

import SwiftUI

struct CardView: View {
    @Binding var discovery: ScientificDiscovery
    
    var body: some View {
        if discovery.wasGuessed {
            Image(discovery.cardImage)
                .resizable()
                .scaledToFit()
                .frame(height: 250)
        } else {
            Image(discovery.cardImage + "-?")
                .resizable()
                .scaledToFit()
                .frame(height: 250)
        }
    }
}
