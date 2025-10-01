# Project 7 - iExpense

## Topics
UserDefaults, Codable, Sheet, onDelete, Observable, Identifiable

## Description
This is Project 7 from the "100 Days of SwiftUI" challenge (https://www.hackingwithswift.com/100/swiftui/36).
This project is an expense tracker app "iExpense" designed to help users manage their personal and business spending.
It allows users to add new expenses, categorize them, and persists data permanently using UserDefaults so information is saved between app launches.

## Challenges
1. Use the user’s preferred currency (Locale) instead of fixed USD.
2. Modify the expense amounts to contain styling depending on their value (VND, Green for < 100k, Orange for < 1M, Red for > 1M).
3. Instead of splitting the list into two sections (which creates a cluttered UI), I implemented a Segmented Picker to filter and toggle between "Personal" and "Business" expenses for a cleaner user experience.

## Demo
<div style="text-align: center;"> 
    <img src="demo.gif" width="300px"/> 
</div>
