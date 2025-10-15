# Milstone Project 10 -12: Friendface

A networking and data visualization application designed to fetch, parse, and display complex user relationships. This project is the **Milestone Project 10-12** challenge from the "100 Days of SwiftUI" (https://www.hackingwithswift.com/100/swiftui/60) course by Paul Hudson. This version has been specifically refactored to utilize SwiftData (as required by Day 61) replacing the previous JSON-only.

## 📱 App Overview

This application serves as a client-side viewer for a simulated social media database. It demonstrates the capability to handle asynchronous network requests, parse complex JSON data structures into Swift types. The app then caches them into a local SwiftData database, and allows users to browse profiles and navigate through friend connections offline.

## ✨ Key Features

**Fetch API & Caching:** Downloads user data from a remote JSON endpoint and persists it locally using SwiftData.

**Offline First:** Once the data is loaded, the app works entirely offline using the ModelContainer.

**User Interface:**

- **User List:** Displays a list of users with active/inactive status indicators.

- **Detail View:** Shows comprehensive user details including age, company, email, address, registration date, and bio.

- **Friends:** List friends associated with each user.

**Deep Navigation:** Tapping on a friend in the "Friends" section navigates to that user's detail page, maintaining a deep navigation stack.

## Demo
<div style="text-align: center;"> 
    <img src="demo.gif" width="300px"/> 
</div>
