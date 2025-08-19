//
//  ContentView.swift
//  CountryApp
//
//  Created by Jesús Ervin Chapi Suyo on 19/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var countries: [Country] = ["item", "otem"]
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
