//
//  ContentView.swift
//  BookShelf
//
//  Created by Sakir Saiyed on 28/05/25.
//

import SwiftUI

class BooksViewModel: ObservableObject {
  @Published var books: [Book] = Book.samples
}

struct BooksListView: View {
  @ObservedObject var booksViewModel: BooksViewModel
  
  var body: some View {
    List {
      ForEach(booksViewModel.books) { book in
        NavigationLink(destination: Text("\(book.title)")) {
            BookRowView(book: book)
        }
      }
    }
  }
}

struct BooksListView_Previews: PreviewProvider {
  static let booksViewModel = BooksViewModel()
  
  static var previews: some View {
    NavigationView {
      BooksListView(booksViewModel: booksViewModel)
        .navigationTitle("Books")
        .preferredColorScheme(.light)
    }
  }
}


