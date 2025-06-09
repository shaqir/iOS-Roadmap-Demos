//
//  ContentView.swift
//  Paws
//
//  Created by Sakir Saiyed on 2025-06-08.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query private var pets: [Pet]
    
    @State private var path = [Pet]()
    
    @State private var isEditing = false
    
    let layout = [
        GridItem(.flexible(minimum: 120)),
        GridItem(.flexible(minimum: 120))
    ]
    
    
    func addPet(){
        isEditing = false
        let pet = Pet(name: "New Pet")
        modelContext.insert(pet)
        path = [pet]
    }
    
    var body: some View {
       
        NavigationStack(path: $path){
            ScrollView{
                LazyVGrid(columns: layout){
                    GridRow{
                        ForEach(pets){ pet in
                            NavigationLink(value: pet){
                                VStack(spacing: 4){
                                    if let imageData = pet.photo{
                                        if let image = UIImage(data: imageData){
                                            Image(uiImage: image)
                                                .resizable()
                                                .scaledToFit()
                                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))

                                        }
                                    }
                                    else{
                                       Image(systemName: "pawprint.circle")
                                            .resizable()
                                            .scaledToFit()
                                            .padding(40)
                                            .foregroundStyle(.quaternary)
                                    }
                                    
                                    Text("\(pet.name)")
                                        .font(.title.weight(.light))
                                        .padding(.vertical)
                                    
                                }//: VSTack
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
                                .overlay(alignment: .topTrailing){
                                    if isEditing{
                                        Menu{
                                            Button("Delete", systemImage: "trash", role: .destructive){
                                                withAnimation(.default){
                                                    modelContext.delete(pet)
                                                    try? modelContext.save()
                                                }
                                            }
                                            
                                        }label:{
                                            Image(systemName: "trash.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 36, height: 36)
                                                .foregroundStyle(.red)
                                                .symbolRenderingMode(.multicolor)
                                                .padding()
                                        }
                                    }
                                }
                            }//:NAVLink
                            .foregroundStyle(.primary)
                        }//:LOOP
                    }//:GRID ROW
                }//: LazyGrid
                .padding(.horizontal)
            }//: ScrollView
            .navigationTitle(pets.isEmpty ? "" : "Paws")
            .navigationDestination(for: Pet.self, destination: EditPetView.init)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                    isEditing.toggle()
                    }label:{
                        Image(systemName: "slider.horizontal.3")
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button("Add a new pet", systemImage: "plus.circle", action: addPet)
                }
            }
            .overlay{
                if pets.isEmpty {
                    CustomContentUnavailableView(
                        icon: "dog.circle",
                        title: "No pets",
                        description:"Add your first pet to get started.")
                }
            }
        }//: Nav Stack
        
    }
}

#Preview("No data") {
    ContentView()
        .modelContainer(for: Pet.self, inMemory: true)
}

#Preview("Sample data"){
    ContentView()
        .modelContainer(Pet.preview)
}
