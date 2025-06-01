//
//  XDismissButton.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 2025-05-31.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.65)
            Image(systemName: "xmark")
                .frame(width: 40, height: 40)
                .imageScale(.small)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    XDismissButton()
}
