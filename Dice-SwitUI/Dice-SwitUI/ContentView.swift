//
//  ContentView.swift
//  Dice-SwitUI
//
//  Created by Prajot Awale on 11/05/24.
//

import SwiftUI

struct ContentView: View {
    
    // @State Use As The Property Wraper.
    
    @State var leftDiceNumber = Int.random(in: 1...6)
    @State var rightDiceNumber = Int.random(in: 1...6)
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("diceeLogo")
                Spacer()
                HStack{
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                    
                }
                .padding(.horizontal)
                Spacer()
                Button(action:{
                    leftDiceNumber = Int.random(in: 1...6)
                    
                    rightDiceNumber = Int.random(in: 1...6)
                }) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white).padding(.horizontal)
                    
                        
                    }
                .background(Color.red)
                Spacer()
                }
                
            }
            
            
            
            
        }
        
    }


struct DiceView: View {
    
    let n:Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}


#Preview {
    ContentView()
}


