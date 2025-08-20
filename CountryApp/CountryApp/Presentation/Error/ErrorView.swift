//
//  ErrorView.swift
//  CountryApp
//
//  Created by Jesús Ervin Chapi Suyo on 20/08/25.
//

import SwiftUI

struct ErrorView: View {
    let error: String
    let onRetry: () -> Void
    
    let spacing : CGFloat = 20
    var body: some View {
        Spacer()
        VStack(spacing: Constants.FontSize.fontSize15) {
            Text("Country App !")
                .font(.title2)
                .bold()
            Text(error)
                .multilineTextAlignment(.center)
            Button(action: {
                onRetry()
            }) {
                Text("Try again")
                    .bold()
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(Color(Constants.AssetColors.primaryColor))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .cornerRadius(16)
        .padding()
        Spacer()
    }
}
