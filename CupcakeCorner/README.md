# Project 10 - Cupcake Corner

## Topics
Codable, URLSession, AsyncImage, @Observable, Form Validation, UserDefaults, Disabled Views.

## Description
This is Project 10 from the "100 Days of SwiftUI" challenge (https://www.hackingwithswift.com/100/swiftui/49).

This project is a multi-screen application for ordering cupcakes. The goal is to build skills in handling network requests (sending and receiving JSON), validating forms, loading remote images using `AsyncImage`, and managing class-based data with `@Observable`.

The app allows users to:
- Select the type and quantity of cupcakes.
- Add special requests (extra frosting, sprinkles).
- Enter delivery details with validation.
- Submit the order to a remote server via a POST request.

## Challenges
1. Improved address validation to ensure fields are not considered valid if they contain only whitespace (added a `String` extension).
2. Added an informative alert to `CheckoutView` to notify the user if the network request fails (e.g., no internet connection).
3. Updated the `Order` class to persist the user's delivery details (Name, Address, City, Zip) to `UserDefaults` so they are saved for future orders, while resolving conflicts between `@Observable` and `Codable`.

## Demo
<div style="text-align: center;">
  <img src="demo.gif" width="300px"/>
</div>