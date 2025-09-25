//
//  ContentView.swift
//  WordScramble
//
//  Created by Hoàng Minh Hải Đăng on 24/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWord = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showAlert = false
    @State private var score = 0
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                }
                Section {
                    ForEach(usedWord, id: \.self){ word in
                        HStack {
                            Image(systemName:"\(word.count).circle")
                            Text(word)
                        }
                    }
                }
                Text("Score: \(score)")
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showAlert) {
                Button("OK") {}
            } message: {
                Text(errorMessage)
            }
            .toolbar {
                Button("Reset") {
                    startGame()
                }
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count >= 3 else {
            wordError(title: "Word too short", message: "You must use 3 letters at least")
            return
        }
        
        guard answer != rootWord else {
            wordError(title: "Dupplicate start word", message: "Word must be different than start word")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation{
            usedWord.insert(answer, at: 0)
        }
        score += 1
        newWord = ""
    }
    
    func startGame() {
        score = 0
        newWord = ""
        usedWord.removeAll()
        // Find URL for "start.txt" in app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // Load "start.txt" into a string
            // if let allWords = try? String(contentsOf: startWordsURL)
            // WARNING: init(contentsOf:)' was deprecated in iOS 18: Use 'init(contentsOf:encoding:)' instead
            // We must explicitly specify the encoding (e.g., .utf8) to ensure the file is read correctly.
            if let startWords = try? String(contentsOf: startWordsURL, encoding: .utf8) {
                // Split the string up into an array of strings base on line breaks
                let allWords = startWords.components(separatedBy: "\n")
                // Pick one random word or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWord.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let textChecker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = textChecker.rangeOfMisspelledWord(
            in: word,
            range: range,
            startingAt: 0,
            wrap: false,
            language: "en"
        )
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showAlert = true
    }
}

#Preview {
    ContentView()
}
