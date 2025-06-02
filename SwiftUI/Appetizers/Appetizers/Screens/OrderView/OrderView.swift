//
//  OrderView.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 30/05/25.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockData.sampleAppetizers
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                        ForEach(orderItems){ appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }.onDelete(perform: deleteItems)
                        
                    }.listStyle(.plain)
                    
                    Spacer()
                    
                    Button{
                        print("Oder placed")
                    } label: {
                        APButton(title: "$ 9.99 Place Order")
                    }.padding(.bottom, 10)
                }
                if orderItems.isEmpty{
                    EmptyState(imgName: "empty-order", title: "You don't have any orders, \nplease order some appetizers!")
                }
            }.navigationTitle("😎 Orders")
        }
    }
    
    func deleteItems(at offsets: IndexSet){
        orderItems.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
}
