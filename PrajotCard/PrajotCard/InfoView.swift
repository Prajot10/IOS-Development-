//
//  InfoView.swift
//  PrajotCard
//
//  Created by Prajot Awale on 11/05/24.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25) // This Kind off Shape
            .frame(height: 50)
            .foregroundColor(.white)
            .overlay(HStack{
                Image(systemName: imageName)
                    .foregroundColor(.green)
                Text(text)
            })
    }
}

#Preview {
    InfoView(text: "hello", imageName: "phone.fill")
        .previewLayout(.sizeThatFits)
}
