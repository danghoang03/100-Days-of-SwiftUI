# Habit Tracking App 📝

A personal tracking application designed to help users build and monitor positive habits. This project is the **Milestone Project 7-9** challenge from the "100 Days of SwiftUI" course by Paul Hudson.

## 📱 App Overview

This application serves as a digital companion for users who want to keep track of how often they perform specific activities (e.g., learning a language, exercising, practicing an instrument). It allows users to create a personalized list of habits, view detailed descriptions, and log their progress effortlessly.

## ✨ Key Features

- **Activity Management:**
  - Create new habits with a custom title and detailed description.
  - **Validation:** Ensures no empty data is entered through smart input validation.
  - Swipe-to-delete functionality to remove unwanted items.
- **Progress Tracking (The Challenge):**
  - **Detail View:** Tap on any habit to view its full description.
  - **Completion Counter:** A dedicated feature allowing users to increment their completion count directly from the detail screen.
  - Real-time updates across the app (List View updates instantly when data changes in Detail View).
- **Data Persistence:**
  - Built with `Codable` and `UserDefaults` to automatically save and load user data.
  - Data persists even after the app is closed or killed ("kill app"), ensuring no progress is lost.

## Demo
<div style="text-align: center;"> 
    <img src="demo.gif" width="300px"/> 
</div>
