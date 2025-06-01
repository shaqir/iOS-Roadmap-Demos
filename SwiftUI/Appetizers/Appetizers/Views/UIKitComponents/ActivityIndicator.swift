//
//  ActivityIndicator.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 2025-05-31.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        
        let indicator = UIActivityIndicatorView(style: style)
        indicator.color = UIColor(.brandPrimary)
        indicator.startAnimating()
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
    
}

struct LoadingView: View {
    var body: some View {

        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            ActivityIndicator(style: .large)
        }
    }
}
 
