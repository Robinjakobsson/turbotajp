//
//  WordManager.swift
//  TurboType
//
//  Created by Robin jakobsson on 2025-03-25.
//

import Foundation

class WordManager {
    
    static let shared = WordManager()
    
    private(set) var words : [Word] = [
        Word(word: "Apple", answer: "Äpple"),
        Word(word: "Banana", answer: "Banan"),
        Word(word: "Kiwi", answer: "Kiwi"),
        Word(word: "Car", answer: "Bil"),
        Word(word: "Mouse", answer: "Mus")
    ]
}
