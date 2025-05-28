//
//  BookRowView.swift
//  BookShelf
//
//  Created by Sakir Saiyed on 28/05/25.
//

import SwiftUI

struct BookRowView: View {
    var book: Book
    
    var titleLabel: some View {
        Text(book.title)
            .font(.headline)
    }
    fileprivate func detailedLabel(_ text: String) -> Text {
        return Text(text)
            .font(.subheadline)
    }
    var body: some View {
        HStack(alignment: .top) {
            Image(book.mediumCoverImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 90)
            VStack(alignment: .leading) {
                titleLabel
                detailedLabel("by \(book.author)")
                detailedLabel("\(book.pages) pages")
            }
            Spacer()
        }
    }
}

#Preview {
    BookRowView(book: Book.samples[0])
}
