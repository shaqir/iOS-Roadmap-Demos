//
//  ContentView.swift
//  GroceryListApp
//
//  Created by Sakir Saiyed on 2025-06-08.
//

import SwiftUI
import SwiftData
import TipKit

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var item: String = ""
    @FocusState private var isFocused: Bool
    let buttonTip = ButtonTip()
    
    init () {
        setupTips()
    }
    
    func setupTips() {
        do {
            try Tips.resetDatastore()
            Tips.showAllTipsForTesting()
            try Tips.configure(
                [.displayFrequency(.immediate)]
            )
        } catch  {
            print("Error initializing Tipkit: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(items) { item in
                    Text(item.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 3)
                        .foregroundStyle( item.isCompleted == false ? Color.primary : Color.accentColor)
                        .strikethrough(item.isCompleted)
                        .italic(item.isCompleted)
                        .swipeActions{
                            Button(action: {
                                withAnimation {
                                    modelContext.delete(item)
                                }
                            }){
                                Label("Delete",
                                      systemImage: "trash")
                            }
                        }
                        .swipeActions(edge: .leading){
                            Button("Done",
                                   systemImage: item.isCompleted == false ? "checkmark.circle" : "x.circle" )
                            {
                                item.isCompleted.toggle()
                            }
                            .tint(item.isCompleted == false ? .green : .accentColor)
                        }
                }
            }
            .navigationTitle("Grocery List")
            .toolbar{
                if items.isEmpty {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            addEssentialItems()
                        }label:{
                            Image(systemName: "carrot")
                        }
                        .popoverTip(buttonTip)
                    }
                }
            }
            .overlay{
                if items.isEmpty {
                    ContentUnavailableView("Empty Cart",
                                           systemImage: "cart.circle",
                                           description: Text("Add items to your cart."))
                }
            }
            .safeAreaInset(edge: .bottom){
                VStack(spacing: 12){
                    TextField("Add item", text: $item)
                        .textFieldStyle(.plain)
                        .padding(12)
                        .background(.tertiary)
                        .cornerRadius(12)
                        .font(.title2.weight(.light))
                        .focused($isFocused)
                    
                    Button{
                        guard !item.isEmpty else { return }
                        let newItem = Item(title: item, isCompleted: false)
                        modelContext.insert(newItem)
                        self.item = ""
                        isFocused = false
                    }label:{
                        Text("Add")
                            .font(.title2.weight(.medium))
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 12))
                    .controlSize(.extraLarge)
                }
                .padding()
                .background(.bar)
            }
            
        }
    }
    
    func addEssentialItems() {
        modelContext.insert(Item(title: "Bananas", isCompleted: false))
        modelContext.insert(Item(title: "Apples", isCompleted: false))
        modelContext.insert(Item(title: "Bread", isCompleted: .random()))
        modelContext.insert(Item(title: "Milk", isCompleted: .random()))
        modelContext.insert(Item(title: "Eggs", isCompleted: .random()))
        modelContext.insert(Item(title: "Cheese", isCompleted: true))
    }
    
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Item.self,
                        inMemory: true)
}


#Preview("sample data") {
    let sampleData: [Item] = [
        Item(title: "Bananas", isCompleted: false),
        Item(title: "Apples", isCompleted: false),
        Item(title: "Bread", isCompleted: .random()),
        Item(title: "Milk", isCompleted: .random()),
        Item(title: "Eggs", isCompleted: .random()),
        Item(title: "Cheese", isCompleted: true),
    ]
    
    let container = try! ModelContainer(
        for: Item.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    
    for item in sampleData {
        container.mainContext.insert(item)
    }
    
    return ContentView()
        .modelContainer(container)
}


