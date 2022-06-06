//
//  GameController.swift
//  WWDC-2022
//
//  Created by Larissa Gomes de Stefano Escaliante on 22/04/22.
//

import SwiftUI

enum turnStatus {
    case didNotGuess
    case wrongGuess
    case rightGuess
}

class GameController {
    
    var turnStatus: turnStatus = .didNotGuess
    
    let allDiscoveries = [
        ScientificDiscovery(
            id: 1,
            year: 1953,
            discoveryName: "Discovery of Molecular Structure of DNA ",
            discoveryImage: "dna",
            discoveryText: """
                Rosalind Franklin was the author of “photo 51”, an image with excellent definition of the DNA that made possible the discovery of the double helix structure, but her name did not take credit for the discovery.
                Her observations allowed other scientists to win the Nobel Prize at her expense, which is why Rosalind is regarded as one of the most wronged women in modern science.
            """,
            scientistName: "Rosalind Franklin",
            scientistImage: "rosa",
            cardImage: "card-rosa"
        ),
        ScientificDiscovery(
            id: 2,
            year: 2019,
            discoveryName: "First Image of a Black Hole",
            discoveryImage: "blackhole",
            discoveryText: """
                Katie Bouman was one of the main responsible for creating and elaborating an algorithm to count the data obtained by telescopes and generate the first image of a black hole.
                The fact that a woman was the protagonist of this discovery triggered a wave of sexist attacks on the internet. A fake news was raised claiming that Katie had made a small contribution to the work, which was denied by her teammates.
            """,
            scientistName: "Katie Bouman",
            scientistImage: "katie",
            cardImage: "card-katie"
        ),
        ScientificDiscovery(
            id: 3,
            year: 1843,
            discoveryName: "First Computer Program",
            discoveryImage: "algoritmo",
            discoveryText: """
                Ada Lovelace was a countess an is nowadays considered the "mother of programming".
                The mathematician was responsible for writing the first programming algorithm ever made, long before computers existed as we know them today.
                Ada was not recognized for her research during her time, being considered a pioneer of computing only after Alan Turing referred to her work.
            """,
            scientistName: "Ada Lovelace",
            scientistImage: "ada",
            cardImage: "card-ada"
        ),
        ScientificDiscovery(
            id: 4,
            year: 1903,
            discoveryName: "Study of Radioactivity",
            discoveryImage: "radioactive",
            discoveryText: """
                Marie Curie was the first woman to win a Nobel Prize and the only one to win it twice.
                The first was the Nobel Prize in Physics for his studies on radioactivity, and the second was in Chemistry for the discovery of Polonium and Radium.
                Marie was prevented from attending higher education, which only accepted men, and faced many barriers when becoming the first woman to teach at Sobornne University.
            """,
            scientistName: "Marie Curie",
            scientistImage: "marie_curie",
            cardImage: "card-marie"
        ),
        ScientificDiscovery(
            id: 5,
            year: 1962,
            discoveryName: "Invention of Wi-Fi Foundations",
            discoveryImage: "wifi",
            discoveryText: """
                Hedy Lamarr was a very famous actress, in addition to being responsible for several inventions and discoveries that revolutionized communication and were the basis for technologies such as Wi-Fi.
                Hedy did not profit from his inventions and received little notoriety from the scientific community compared to other scientists at the time.
            """,
            scientistName: "Hedy Lamarr",
            scientistImage: "hedy",
            cardImage: "card-hedy"
        )
    ]
    
    var turn = 0
    
    func getCurrentCard() -> ScientificDiscovery {
        return allDiscoveries[turn]
    }
    
    func updateTurnAndCheckEnd() -> Bool {
        turn += 1
        return turn == allDiscoveries.count
    }
    
    func getNextDicovery() -> ScientificDiscovery {
        return allDiscoveries[turn]
    }
    
    func getText() -> String {
        switch turnStatus {
        case .didNotGuess:
            return "Try to position the event on the timeline"
        case .wrongGuess:
            return "Wrong answer! Try again"
        case .rightGuess:
            return "That's right, this discovery was made in \(allDiscoveries[turn - 1].year)"
        }
    }
    
    func getColorText() -> Color {
        switch turnStatus {
        case .didNotGuess:
            return .white
        case .wrongGuess:
            return .red
        case .rightGuess:
            return .green
        }
    }
}
