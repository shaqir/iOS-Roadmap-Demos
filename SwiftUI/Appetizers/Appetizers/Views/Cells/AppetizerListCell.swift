//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 30/05/25.
//

import SwiftUI

struct AppetizerListCell: View {
    var appetizer: Appetizer
    var body: some View {
        HStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 5){
                Text("\(appetizer.name)")
                    .font(.title3)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .font(.headline)
                    .foregroundColor(.brandPrimary)
                    .fontWeight(.semibold)
                Text("\(appetizer.calories) calories")
                    .font(.subheadline)
                    .foregroundColor(.brown)
                    .fontWeight(.medium)
            }
            .padding(.leading)
            
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizers[0])
}
