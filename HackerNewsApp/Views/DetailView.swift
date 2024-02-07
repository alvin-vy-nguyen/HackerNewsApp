//
//  DetailView.swift
//  HackerNewsApp
//
//  Created by Alvin Nguyen on 2/4/24.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}


