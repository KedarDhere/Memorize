//
//  MemoryGame.swift
//  Memorize_Week2
//
//  Created by Kedar Dhere on 8/3/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards : Array<Card>
    private(set) var score : Int = 0
    private var indexOfTheOneAndOnlyOneFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int, createCardContent:(Int) -> CardContent) {
        cards = Array<Card>()
        //Add 2*numberOfPairsOfCards to the cards
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyOneFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                }
                indexOfTheOneAndOnlyOneFaceUpCard = nil
            } else {
                    for index in cards.indices {
                        cards[index].isFaceUp = false
                    }
                indexOfTheOneAndOnlyOneFaceUpCard = chosenIndex
                if cards[chosenIndex].previouslySeen {
                    score -= 1
                }
                }
                cards[chosenIndex].isFaceUp.toggle()
                cards[chosenIndex].previouslySeen = true
            }
        }
        
        
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var previouslySeen: Bool = false
        var content: CardContent
        
        var id: Int
    }
}
