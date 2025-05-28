//
//  ContentView.swift
//  SwiftUIDemos
//
//  Created by Sakir Saiyed on 26/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    
    var body: some View {
        Form {
            TextField("Write your Name:", text: $name)
            Text("My name is \(name)")
        }
        
    }
}

#Preview {
    ContentView()
}
