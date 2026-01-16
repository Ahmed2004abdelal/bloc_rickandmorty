# 🧪 Rick and Morty App

A Flutter application that displays all Rick and Morty characters with the ability to search and view detailed information about each character.  
This project was built to practice **Bloc/Cubit state management**.

---

## ✨ Features
- 🏠 Home page displaying all Rick and Morty characters
- 🔍 Search for any character by name
- 📄 View detailed information for each character
- ⚡ Fast and responsive UI
- 🧠 State management using **Bloc / Cubit**
- 🌐 API integration

---

## 📱 Screens
- Characters List Screen
- Character Details Screen
- Search Screen

---

## 🛠️ Tech Stack
- **Flutter**
- **Dart**
- **Bloc / Cubit**
- **REST API** (Rick and Morty API)
- **HTTP**

---

## 🧠 State Management
This project uses **Bloc/Cubit** to:
- Handle API requests
- Manage loading, success, and error states
- Separate business logic from UI

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK
- Android Studio or VS Code
- Emulator or real device

### Installation
```bash
git clone https://github.com/Ahmed2004abdelal/RickAndMortyApp.git
cd RickAndMortyApp
flutter pub get
flutter run
lib/
 ├── core/
 ├── features/
 │    ├── characters/
 │    │     ├── data/
 │    │     ├── logic/
 │    │     └── ui/
 ├── models/
 └── main.dart
