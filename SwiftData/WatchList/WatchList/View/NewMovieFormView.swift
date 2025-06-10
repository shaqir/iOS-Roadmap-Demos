//
//  NewMovieFormView.swift
//  WatchList
//
//  Created by Sakir Saiyed on 2025-06-09.
//

import SwiftUI

struct NewMovieFormView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    // MARK: - PROPERTIES
    @State private var title: String = ""
    @State private var selectedGenre: Genre = .comedy
    
    // MARK: - FUNCTIONS
    
    private func addNewMovie() {
        guard !title.isEmpty else { return }
        let newMovie = Movie(title: title, genre: selectedGenre)
        modelContext.insert(newMovie)
        title = ""
        selectedGenre = .comedy
    }
    
    var body: some View {
        Form {
            List{
                // MARK: - HEADER
                Text("What to watch?")
                    .font(.largeTitle.weight(.black))
                    .foregroundStyle(.blue.gradient)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding(.vertical)
                
                // MARK: - TITLE
                TextField("Movie Title", text:$title)
                    .textFieldStyle(.roundedBorder)
                    .font(.largeTitle.weight(.light))
                
                
                // MARK: - GENRE
                
                Picker("Genre", selection: $selectedGenre){
                    ForEach(Genre.allCases){ genre in
                        Text(genre.name)
                            .tag(genre)
                    }
                }
                
                // MARK: - SAVE BUTTON
                
                Button{
                    if title.isEmpty || title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        print("Empty title")
                        return
                    }
                    else {
                        print(title)
                        addNewMovie()
                        dismiss()
                    }
                    
                }label: {
                    Text("Save")
                        .font(.title2.weight(.medium))
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                .buttonBorderShape(.roundedRectangle)
                .disabled(title.isEmpty || title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                
                // MARK: - CANCEL BUTTON
                
                Button{
                    dismiss()
                }label: {
                    Text("Close")
                        .font(.title2.weight(.medium))
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
            }//: List
            .listRowSeparator(.hidden)
        }//: Form
    }
}

#Preview {
    NewMovieFormView()
}
