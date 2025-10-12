//
//  ContentView.swift
//  Bookworm
//
//  Created by Hoàng Minh Hải Đăng on 11/10/25.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Query(sort: [
        SortDescriptor(\Book.rating, order: .reverse),
        SortDescriptor(\Book.title)
    ]) var books: [Book]
    @Environment(\.modelContext) var modelContext
    @State private var showingAddScreen = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                    .foregroundStyle(book.rating > 1 ? Color.primary : Color.red)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                            
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our query
            let book = books[offset]

            // delete it from the context
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
