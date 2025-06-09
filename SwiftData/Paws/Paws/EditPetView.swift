//
//  EditPetView.swift
//  Paws
//
//  Created by Sakir Saiyed on 2025-06-08.
//

import SwiftUI
import SwiftData
import PhotosUI

struct EditPetView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Bindable var pet: Pet
    @State private var photopickeritem: PhotosPickerItem?

    
    var body: some View {
        
        Form{
            
            // MARK: - IMAGE
            if let imageData = pet.photo{
                if let image = UIImage(data: imageData){
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
                        .padding(.top)
                }
            }
            else
            {
                CustomContentUnavailableView(
                    icon: "pawprint.cirlce",
                    title: "No Photo",
                    description: "Add a photo of your fav pet.")
                    .padding(.top)
            }
            
            // MARK: - PHOTO PICKER
            PhotosPicker(selection: $photopickeritem, matching: .images){
                Label("Select a Photo", systemImage: "photo.on.rectangle.fill")
                    .frame(minWidth: 0, maxWidth: .infinity)
            }.listRowSeparator(.hidden)
            
            // MARK: - TEXT FIELD
            TextField("Name:", text: $pet.name)
                .textFieldStyle(.roundedBorder)
                .font(.largeTitle.weight(.light))
                .padding(.vertical)
            
            // MARK: - BUTTON
            Button{
                dismiss()
            }label: {
                Text("Save")
                    .font(.title2.weight(.medium))
                    .padding(8)
                    .frame(minWidth: 0, maxWidth: .infinity)
                
            }//: Button
            .buttonStyle(.borderedProminent)
            
            
        }//:Form
        .listStyle(.plain)
        .navigationTitle("Edit \(pet.name)")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .onChange(of: photopickeritem){
            Task{
                pet.photo = try? await photopickeritem?.loadTransferable(type: Data.self)
            }
        }
    }
}

#Preview {
    let sampleData = Pet(name: "Daisy")
    EditPetView(pet: sampleData)
}



/*
 
 #Preview{
 NavigationStack{
 do{
 let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
 let container = try ModelContainer(for: Pet.self, configuration: configuration)
 let sampleData = Pet(name: "Daisy")
 
 return EditPetView(pet: sampleData)
 .modelContainer(container)
 }
 catch{
 fatalError("Could not load preview data: \(error.localizedDescription)")
 }
 }//:NAVSTACK
 }
 */

