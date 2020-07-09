//
//  Practice.swift
//  WeSplit
//
//  Created by Wajid K Patan on 7/8/20.
//  Copyright © 2020 wajidInc. All rights reserved.
//

import SwiftUI

struct Practice: View {
  
  @State private var useRedText = false
  
    var body: some View {
      Button("Hello World"){
        self.useRedText.toggle()
      }.foregroundColor(useRedText ? .red : .blue)
      
    }
}

struct Practice_Previews: PreviewProvider {
    static var previews: some View {
        Practice()
    }
}
