# Project 11 - Bookworm

## Topics
SwiftData, @Model, @Query, TextEditor, @Binding, Custom Components, Form Validation, SortDescriptor.

## Description
This is Project 11 from the "100 Days of SwiftUI" challenge (https://www.hackingwithswift.com/100/swiftui/53).

This project is a personal library tracking application. The goal is to build skills in using SwiftData for persistent storage (creating, reading, updating, and deleting data), creating custom UI components (like a star rating view), and managing complex forms.

The app allows users to:
- Add new books with a title, author, genre, and personal review.
- Rate books using a custom interactive star rating system.
- View a list of saved books, automatically sorted by rating and title.
- View detailed information about a book with genre-specific imagery.
- Delete books from the persistent store.

## Challenges
1. Implemented form validation in `AddBookView` to ensure the title, author, and genre fields are not empty or generic whitespace before saving.
2. Modified `ContentView` to highlight books rated with 1 star by displaying their title in red, offering immediate visual feedback for low-rated items.
3. Added a `date` attribute to the `Book` model to verify when a book was added, and displayed this date nicely formatted in the `DetailView`.

## Demo
<div style="text-align: center;">
  <img src="demo.gif" width="300px"/>
</div>
