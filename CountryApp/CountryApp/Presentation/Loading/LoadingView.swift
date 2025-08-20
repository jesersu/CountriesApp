//
//  LoadingView.swift
//  CountryApp
//
//  Created by Jesús Ervin Chapi Suyo on 20/08/25.
//
import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color("primary")))
                .scaleEffect(2)
        }
        .navigationBarHidden(true)
    }
}
