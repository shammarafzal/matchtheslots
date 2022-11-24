//
//  ContentView.swift
//  MatchTheSlots
//
//  Created by Ammar Afzal on 23/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 1000
    @State private var slot1 = 1
    @State private var slot2 = 1
    @State private var slot3 = 1
    @State private var showingAlert = false
    var body: some View {
        VStack{
            Spacer()
            Text("Match The Slots!")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            HStack{
                Text("Credits: ")
                Text(String(score))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(.systemPink))
            }
            Spacer()
            HStack{
                Spacer()
                Image("slot\(slot1)").resizable().aspectRatio(contentMode: .fit)
                Image("slot\(slot2)").resizable().aspectRatio(contentMode: .fit)
                Image("slot\(slot3)").resizable().aspectRatio(contentMode: .fit)
                Spacer()
            }
            Spacer()
                
            Button(
                "Spin",
                action: {
                     slot1 = Int.random(in: 1...3)
                     slot2 = Int.random(in: 1...3)
                     slot3 = Int.random(in: 1...3)
                    if(slot1 == 1 && slot2 == 1 && slot3 == 1){
                        score += 25
                    }
                    else{
                        score -= 25
                    }
                    if (score == 0){
                        showingAlert = true
                        score = 1000
                    }
                }
            )           // Set padding for all edges
            .padding()
            // Then adjust the left and right padding to be bigger
            .padding([.leading, .trailing], 40)
            .foregroundColor(.white)
            .background(Color(.systemPink))
            .cornerRadius(25)
            .font(.system(size: 18, weight: .bold, design: .default)).alert(isPresented: $showingAlert) {
                Alert(title: Text("Important message"), message: Text("Game Ended"), dismissButton: .default(Text("Got it!")))}
                
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
