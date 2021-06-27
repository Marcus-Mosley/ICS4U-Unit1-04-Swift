//
// ContentView.swift
// ICS4U-Unit1-04-Swift
//
// Created by Marcus A. Mosley on 2021-01-20
// Copyright (C) 2021 Marcus A. Mosley. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var item:String = ""
    @State var itemInt:Double = 0
    @State var amount:String = ""
    @State var time:Double = 0
    @State var showingAlert = false
    
    var body: some View {
        VStack {
            TextField("Enter the type of items you want to heat up (Choices are Pizza, Sub, or Soup): ", text: $item)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
                .keyboardType(.numberPad)
            TextField("Enter the amount of items needing to be heated up (1-3): ", text: $amount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
                .keyboardType(.numberPad)
            Button(action: {
                if item.contains("Pizza") {
                    itemInt = 0.75
                } else if item.contains("Sub") {
                    itemInt = 1
                } else if item.contains("Soup") {
                    itemInt = 1.75
                } else {
                    showingAlert = true
                }
                if Double(amount) != nil && Double(amount)! > 0 && Double(amount)! <= 3 {
                    time = itemInt + (Double(amount)! - 1) / 2 * itemInt
                    print("You need to heat up those items for \(time) minutes.")
                } else {
                    showingAlert = true
                }
            }) {
                Text("Click Here")
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("Important Message"), message: Text("Not Valid Input"), dismissButton: .default(Text("Got It!")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
