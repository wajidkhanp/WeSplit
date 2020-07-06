//
//  ContentView.swift
//  WeSplit
//
//  Created by Wajid K Patan on 7/5/20.
//  Copyright © 2020 wajidInc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var checkAmount = ""
  @State private var numberOfPeople = 2
  @State private var tipPercentage = 2
  
  let tipPercentages = [ 5, 10, 15, 20, 25, 0]
  
  var totalPerPerson: Double {
    let peopelCount = Double(numberOfPeople+2)
    let tipSelection = Double(tipPercentages[tipPercentage])
    let orderAmount = Double(checkAmount) ?? 0
    
    return (orderAmount + (orderAmount * (tipSelection/100)))/peopelCount
  }
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Amount", text: $checkAmount)
            .keyboardType(.decimalPad)
          Picker("Number of people", selection: $numberOfPeople) {
            ForEach(2..<100){
              Text("\($0) People" )
            }
          }
        }
        
        Section(header: Text("How much tip you want to leave")) {
          Picker("Tip Percentage", selection: $tipPercentage) {
            ForEach(0..<tipPercentages.count) {
              Text("\(self.tipPercentages[$0])%")
            }
          }.pickerStyle(SegmentedPickerStyle())
        }
        
        Section(header: Text("Total per person is")){
          Text("$\(totalPerPerson, specifier: "%.2f")")
        }
      }.navigationBarTitle("WeSplit")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
