//
//  ContentView.swift
//  PrajotCard
//
//  Created by Prajot Awale on 11/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red:0.09,green:0.63,blue:0.52)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/) //Color Is use to Give Color
            VStack {
                //Image
                Image("Prajot")
                    .resizable() // Make Image Resizeable
                    .aspectRatio(contentMode:.fit) // To Edit Aspact Ratio
                    .frame(width: 150.0, height: 150.0) // To Change height and Width
                    .clipShape(Circle()) // To Chnage Shape For Image
                    .overlay(Circle()
                        .stroke(Color.white, lineWidth: 5)) // To Add some on the top of Image
                
                Text("Prajot Awale")
                    .font(Font.custom("Pacifico-Regular", size: 40)) // To Give Font To Images
                    .bold() // To MAke Image Bold
                    .foregroundColor(.white) // To Chnage The ForeGround Color
                
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider() // To Divide The Page in to Divisions
                InfoView(text: "+91 9876543201", imageName: "phone.fill")
                Divider()
                InfoView(text: "prajot1@gmail.com", imageName: "envelope.fill")
                
                
            }
            .padding(.all)
        }
        
    }
}

#Preview {
    ContentView()
}


