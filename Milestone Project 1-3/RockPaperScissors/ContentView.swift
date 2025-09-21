//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Hoàng Minh Hải Đăng on 21/09/25.
//

import SwiftUI

struct SystemChoice: View {
    var choice: String
    
    var body: some View {
        Text(choice)
            .font(.system(size: 100))
    }
}

struct Choice: View {
    let action: (String) -> Void
    let choice: String
    
    var body: some View {
        Button {
            action(choice)
        }
        label: {
            Text(choice)
                .font(.system(size: 75))
        }
    }
}

struct ContentView: View {
    let moves = ["✊", "🖐️", "✌️"]
    @State private var systemChoice = Int.random(in: 0...2)
    @State private var mustWin = Bool.random()
    @State private var gameCounter = 1
    @State private var score = 0
    @State private var endGame = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 1.0, green: 0.9, blue: 0.7),
                            Color(red: 1.0, green: 0.8, blue: 0.7)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Game \(gameCounter)")
                    .font(.largeTitle.bold())
                Spacer()
                SystemChoice(choice: moves[systemChoice])
                HStack(spacing: 0) {
                    Text("How to ")
                    Text(mustWin ? "Win" : "Lose")
                        .foregroundColor(.red)
                        .bold()
                    Text(" this game?")
                }
                .font(.system(size: 20))
                Spacer()
                HStack(spacing: 20) {
                    ForEach(moves, id: \.self) {
                        Choice(action: choiceTapped, choice: $0)
                    }
                }
                Spacer()
                Text("Score: \(score)")
                    .font(.system(size: 25))
                Spacer()
            }
            .alert("End Game!", isPresented: $endGame) {
                Button("Play Again!", action: reset)
            }
                message: {
                    Text("Your final score is \(score)")
                }
        }
    }
    
    func choiceTapped(choice: String) {
        switch mustWin {
        case true:
            if choice == "✊" {
                if systemChoice == 2 {
                    score += 1
                } else {
                    score = score > 0 ? score - 1 : 0
                }
            } else if choice == "🖐️" {
                if systemChoice == 0 {
                    score += 1
                } else {
                    score = score > 0 ? score - 1 : 0
                }
            } else {
                if systemChoice == 1 {
                    score += 1
                } else {
                    score = score > 0 ? score - 1 : 0
                }
            }
        case false:
            if choice == "✊" {
                if systemChoice == 1 {
                    score += 1
                } else {
                    score = score > 0 ? score - 1 : 0
                }
            } else if choice == "🖐️" {
                if systemChoice == 2 {
                    score += 1
                } else {
                    score = score > 0 ? score - 1 : 0
                }
            } else {
                if systemChoice == 0 {
                    score += 1
                } else {
                    score = score > 0 ? score - 1 : 0
                }
            }
        }
        if gameCounter != 10 {
            gameCounter += 1
            systemChoice = Int.random(in: 0...2)
            mustWin.toggle()
        }
        else {
            endGame = true
        }
    }
    
    func reset() {
        gameCounter = 1
        score = 0
        systemChoice = Int.random(in: 0...2)
        mustWin = Bool.random()
    }
}

#Preview {
    ContentView()
}
