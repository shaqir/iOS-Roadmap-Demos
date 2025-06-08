//
//  ContentView.swift
//  WishListApp
//
//  Created by Sakir Saiyed on 2025-06-08.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    
    @State private var isAlertShowing: Bool = false
    @State private var title: String = ""
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(wishes){ wish in
                    Text(wish.title)
                        .font(.title2.weight(.light))
                        .padding(.vertical,4)
                        .swipeActions{
                            Button("Delete", role: .destructive){
                                modelContext.delete(wish)
                            }
                        }
                }
            }
            .navigationBarTitle("Wish List")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                        isAlertShowing.toggle()
                    }){
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                if wishes.isEmpty != true {
                    ToolbarItem(placement: .bottomBar){
                        Text("\(wishes.count) wish\(wishes.count == 1 ? "" : "es")")
                    }
                }
                
            }
            .alert("Create a new wish", isPresented: $isAlertShowing){
                TextField("Enter a wish", text:$title)
                Button{
                    modelContext.insert(Wish(title: title))
                    title = ""
                }label:{
                    Text("Save")
                }
            }
            .overlay{
                if wishes.isEmpty{
                    ContentUnavailableView("My Wish List",systemImage: "heart.circle",description: Text("No wishes found yet. Add your first wish by tapping the plus button in the top right corner."))
                }
            }
        }
    }
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}

#Preview("List with Wish samples Data"){
    
    let container = try! ModelContainer(for: Wish.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    container.mainContext.insert(Wish(title: "Master Swift Data"))
    container.mainContext.insert(Wish(title: "Learn SwiftUI"))
    container.mainContext.insert(Wish(title: "Build a SwiftUI App"))
    container.mainContext.insert(Wish(title: "Run a Marathon"))
    container.mainContext.insert(Wish(title: "Learn Python"))
    container.mainContext.insert(Wish(title: "Build a Cross Platform App"))
    
    return ContentView().modelContainer(container)
}
