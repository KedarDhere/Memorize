//
//  EmojiMemoryGame.swift
//  Memorize_Week2
//
//  Created by Kedar Dhere on 8/3/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
//        if var randomtheme = theme {
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(createTheme: theme)
//        }
    }
    
    static let themes: Array<Themes.Theme> = [
        Themes.Theme(nameOftheme: "Vehicles", emojis: ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚", "🚛","🚜", "🛺", "✈️", "🚈", "🚂","🛳","🚀","🚡","🛵","🚍","🚔"], numberOfPairOfcards: 10, color: "red"),

        Themes.Theme(nameOftheme: "Flags", emojis: ["🏳️","🇦🇹","🇦🇺","🇧🇿","🇧🇦","🇦🇲","🇨🇦","🇰🇾","🇧🇧","🇮🇴"], numberOfPairOfcards: 9, color: "blue"),

        Themes.Theme(nameOftheme: "Faces", emojis: ["😀","🤣","🙃","😚","😎","🤩"], numberOfPairOfcards: 6, color: "yellow"),

        Themes.Theme(nameOftheme: "Places", emojis: ["🏡","🏔","🕍","🏣","🏛"], numberOfPairOfcards: 5, color: "purple"),

        Themes.Theme(nameOftheme: "Food", emojis: ["🍇","🍔","🍟","🥪","🍫","🍧","🍚","🎂"], numberOfPairOfcards: 8, color: "green"),

        Themes.Theme(nameOftheme: "Games", emojis: ["⚽️","🏑","🏏","🥍"], numberOfPairOfcards: 4, color: "orange")
    ]
        
    static func createMemoryGame(createTheme: Themes.Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: createTheme.numberOfPairOfcards){ pairIndex in return createTheme.emojis[pairIndex]}
    }
    
    private(set) var theme: Themes.Theme
    @Published private var model: MemoryGame<String>
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    var themeColor: Color {
        switch theme.color {
        case "red"    : return .red
        case "blue"   : return .blue
        case "yellow" : return .yellow
        case "purple" : return .purple
        case "green"  : return  .green
        case "orange" : return .orange
        default: return .red
        }
    }
    
//    MARK: Intent
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
//        if var randomTheme = theme {
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(createTheme: theme)
//        }
    }
}
