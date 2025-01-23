//
//  ContentView.swift
//  I AM RICH 2
//
//  Created by Prajot Awale on 09/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("I Am Rich")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit).frame(width: 200, height: 200, alignment: .center)
                
            }
        }
    }
}

#Preview {
    ContentView()
}
