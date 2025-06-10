//
//  ContentView.swift
//  WatchList
//
//  Created by Sakir Saiyed on 2025-06-09.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    //:MARK PROPERTIES
    @Environment(\.modelContext) var modelContext
    @Query private var movies: [Movie]
    @State private var isSheetPresented: Bool = false
    @State private var randomMovie: String = ""
    @State private var isShowingAlert: Bool = false
    
    // MARK: Functions
    
    private func fetchRandomMovie() {
        guard !movies.isEmpty else { return }
        randomMovie = movies.randomElement()!.title
    }
    
    var body: some View {
        List {
            if !movies.isEmpty {
                Section(
                    header:
                        VStack{
                            Text("Watch List")
                                .font(.largeTitle.weight(.black))
                                .foregroundStyle(.blue.gradient)
                                .padding()
                            
                            HStack{
                                Label("Movies", systemImage: "movieclapper")
                                Spacer()
                                Label("Genre", systemImage: "tag")
                            }
                        }
                ) {
                    ForEach(movies) { movie in
                        HStack{
                            Text(movie.title)
                                .font(.title.weight(.light))
                                .padding(.vertical, 2)
                            Spacer()
                            Text(movie.genre.name)
                                .font(.caption.weight(.medium))
                                .padding(.horizontal, 6)
                                .padding(.vertical,2)
                                .background(
                                    Capsule().stroke(style: StrokeStyle(lineWidth: 1.5))
                                )
                                .foregroundStyle(.tertiary)
                            
                        }//: LIST ROW
                        .swipeActions{
                            Button(role: .destructive){
                                withAnimation{
                                    modelContext.delete(movie)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        
                    }
                }
            }
        }//: LIST
        .overlay{
            if movies.isEmpty {
                EmptyListView()
            }
        }
        .safeAreaInset(edge: .bottom, alignment: .center){
            HStack {
                Spacer()
                if movies.count >= 2 {
                    Button{
                        fetchRandomMovie()
                        isShowingAlert = true
                    } label: {
                        ButtonImageView(symbolname: "arrow.trianglehead.2.clockwise.rotate.90.circle.fill")
                    }
                    .alert(randomMovie, isPresented: $isShowingAlert){
                        Button("OK", role: .cancel){
                            
                        }
                    }//: Alert
                    .accessibilityLabel("Random Movie")
                    .sensoryFeedback(.success, trigger: isShowingAlert)
                    Spacer()
                }
                
                Button{
                    isSheetPresented.toggle()
                }label: {
                    ButtonImageView(symbolname: "plus.circle.fill")
                }
                .accessibilityLabel("New Movie")
                .sensoryFeedback(.success, trigger: isSheetPresented)
                
                Spacer()
            }.padding(.horizontal)
        }//: Safe area
        // MARK : Sheet
        .sheet(isPresented: $isSheetPresented){
            NewMovieFormView()
        }
        
    }
}

#Preview("Empty List") {
    ContentView().modelContainer(for: Movie.self, inMemory: true)
}

#Preview("sample data"){
    ContentView()
        .modelContainer(Movie.preview)
}
