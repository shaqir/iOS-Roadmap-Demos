//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 2025-05-31.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(appetizer.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .padding()
                
                HStack(alignment: .center, spacing: 30){
                    NutritionInfoView(title: "Calories", value: "\(appetizer.calories)")
                    NutritionInfoView(title: "Carbs", value: "\(appetizer.carbs)")
                    NutritionInfoView(title: "Protein", value: "\(appetizer.protein)")
                }.padding()
            }
            Spacer()
            Button{
                print("tapped")
                order.add(appetizer)
                isShowingDetail = false
            }label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f")- Add to Order")
            }
            .padding(.bottom, 30)
            
        }
        .frame(width: 300, height: 525)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button{
            print("tapped")
            isShowingDetail = false
        }label: {
            XDismissButton()
        }, alignment: .topTrailing)
        
    }
}

struct NutritionInfoView: View {
    
    let title: String
    let value : String
    
    var body: some View {
        
        VStack(spacing: 5){
            Text(title)
                .bold()
                .font(.subheadline)
            Text(value)
                .italic()
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizers.first!,
                        isShowingDetail: .constant(true))
    
}
