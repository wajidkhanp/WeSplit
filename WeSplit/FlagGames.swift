//
//  FlagGames.swift
//  WeSplit
//
//  Created by Wajid K Patan on 7/6/20.
//  Copyright © 2020 wajidInc. All rights reserved.
//

import SwiftUI

struct FlagGames: View {
  
  @State private var banks = ["American Express", "Bank of America", "CapitalOne", "Chase Bank", "Citi Bank", "Wellls Forgo", "US Bank"].shuffled()
  @State private var correctAnswer = Int.random(in: 0...2)
  
  @State private var showingScore = false
  
  @State private var scoreTitle = ""
  
  @State private var score = 0
  
  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [.blue, .blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
      
      VStack(spacing: 30){
        VStack {
          Text("Tap the App of ")
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.black)
          Text(banks[correctAnswer])
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.black)
          
          ForEach(0..<3) { number in
            Button(action: {
              self.falgTapped(number)
            }){
              Image(self.banks[number]).resizable().frame(width: 100, height: 100, alignment: .center).cornerRadius(4)
            }.buttonStyle(PlainButtonStyle())
          }
          Text("Your Score is \(self.score)")
          Spacer()
        }
      }
    } .alert(isPresented: $showingScore) {
      Alert(title: Text(scoreTitle), message: Text("Your Score is \(score)"), dismissButton: .default(Text("Continue")) {
        self.askQuestion()
        })
    }
  }
  
  func falgTapped(_ number: Int){
    if number == correctAnswer {
      scoreTitle = "Correct"
      score += 1
    } else {
      scoreTitle = "Wrong"
        score -= 1
    }
    showingScore = true
  }
  
  func askQuestion() {
    banks.shuffle()
    correctAnswer = Int.random(in: 0...2)
  }
}

struct FlagGames_Previews: PreviewProvider {
  static var previews: some View {
    FlagGames()
  }
}
