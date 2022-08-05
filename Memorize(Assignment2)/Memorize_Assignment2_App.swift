//
//  Memorize_Assignment2_App.swift
//  Memorize(Assignment2)
//
//  Created by Kedar Dhere on 8/4/22.
//

import SwiftUI

@main
struct Memorize_Assignment2_App: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
