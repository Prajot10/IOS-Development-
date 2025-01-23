//
//  DetailView.swift
//  H4X0R News
//
//  Created by Prajot Awale on 15/05/24.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}
