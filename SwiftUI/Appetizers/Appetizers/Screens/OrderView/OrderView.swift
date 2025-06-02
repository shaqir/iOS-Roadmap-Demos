//
//  OrderView.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 30/05/25.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                        ForEach(order.items){ appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }.onDelete(perform: order.deleteItems)
                        
                    }.listStyle(.plain)
                    
                    Spacer()
                    
                    Button{
                        print("Oder placed")
                    } label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f")- Place Order")
                    }.padding(.bottom, 10)
                }
                if order.items.isEmpty{
                    EmptyState(imgName: "empty-order", title: "You don't have any orders, \nplease order some appetizers!")
                }
            }.navigationTitle("😎 Orders")
        }
    }
    
    
}

#Preview {
    OrderView()
}
