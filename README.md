# 🎓 Student Grade Tracker

<div align="center">

A modern **Flutter** application for managing student subjects, calculating grades, and viewing academic summaries.

Built with **Provider**, **Material 3**, and **Flutter Best Practices** — without a single `setState()` call.

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-blue?logo=dart)
![Provider](https://img.shields.io/badge/State_Management-Provider-success)
![Material 3](https://img.shields.io/badge/UI-Material_3-orange)
![License](https://img.shields.io/badge/License-MIT-green)

</div>

---

# 📱 Screenshots

> Create a folder named **screenshots** in the project root and place your images there.

| Light Theme                     | Dark Theme                     |
|---------------------------------|--------------------------------|
| ![](screenshots/light-home.png) | ![](screenshots/dark-home.png) |

| Add Subject                      | Subject List                      | Summary                      |
|----------------------------------|-----------------------------------|------------------------------|
| ![](screenshots/add-subject.png) | ![](screenshots/subject-list.png) | ![](screenshots/summary.png) |

---

# ✨ Features

* 📚 Add new subjects with marks (0–100)
* ✅ Complete form validation
* 🏆 Automatic grade calculation (A, B, C, F)
* 📋 View all subjects in a clean list
* 🗑 Swipe to delete subjects using **Dismissible**
* 📊 Live academic summary
* 📈 Automatic average mark calculation
* 🌗 Custom Light & Dark themes
* ⚡ Provider-based state management
* 📱 Responsive Material 3 UI
* 🚫 Zero `setState()` calls

---

# 🧠 Grade Calculation

### Subject Grade

|    Marks | Grade |
|---------:|:-----:|
| 80 - 100 |   A   |
|  65 - 79 |   B   |
|  50 - 64 |   C   |
|   0 - 49 |   F   |

The **Overall Grade** is calculated using the class average with the same grading criteria.

---

# 📂 Project Structure

```text
lib/

├── main.dart                     # App entry point, sets up MultiProvider
├── app.dart                      # Root MaterialApp, wires up themes
│
├── models/
│   └── subject.dart              # Subject model (private _mark + grade getter)
│
├── providers/
│   ├── subject_provider.dart     # List<Subject>, add/remove, stats (map/where)
│   ├── theme_provider.dart       # Light/Dark ThemeMode state
│   └── navigation_provider.dart  # BottomNavigationBar tab index state
│
├── screens/
│   ├── home_screen.dart          # Hosts BottomNavigationBar + AppBar toggle
│   ├── add_subject_screen.dart   # Form to add a new subject
│   ├── subject_list_screen.dart  # Dismissible ListView of subjects
│   └── summary_screen.dart       # Aggregate statistics dashboard
│
├── widgets/
│   ├── subject_card.dart         # Card UI for a single subject
│   ├── custom_textfield.dart     # Reusable themed text field
│   └── summary_card.dart         # Reusable stat tile
│
├── themes/
│   ├── light_theme.dart          # Custom Material 3 light ThemeData
│   └── dark_theme.dart           # Custom Material 3 dark ThemeData
│
└── utils/
    └── validators.dart           # Form validation rules
```

---

# 🏗 Architecture

The application follows a simple feature-based architecture with clear separation of responsibilities.

### Model

* `Subject`

    * Stores subject information
    * Uses a private `_mark` field
    * Provides computed `grade` getter

### Providers

**SubjectProvider**

Responsible for:

* Managing `List<Subject>`
* Adding subjects
* Removing subjects
* Calculating average marks
* Computing overall grades
* Filtering passing and failing subjects using `.where()`
* Using `.map()` for data transformations

**ThemeProvider**

* Controls Light/Dark mode
* Updates the application theme using `notifyListeners()`

**NavigationProvider**

* Controls BottomNavigationBar navigation
* Eliminates the need for `setState()`

---

# 🎨 UI Features

* Material 3 Design
* Responsive Layout
* Custom ThemeData
* Reusable Widgets
* Consistent Spacing
* Rounded Cards
* Modern Typography
* Adaptive Colors using `Theme.of(context)`

---

# ⚙ State Management

This project uses **Provider** as the only state management solution.

No widget in the project uses `setState()`.

The application automatically rebuilds UI through `ChangeNotifier` and `notifyListeners()`, ensuring that:

* Subject List updates instantly
* Summary statistics refresh automatically
* Theme changes apply immediately
* Navigation remains reactive

---

# 🚀 Getting Started

## Prerequisites

* Flutter SDK 3.x
* Dart SDK
* Android Studio / VS Code

## Installation

Clone the repository

```bash
git clone https://github.com/shahjalal-mahmud/student_grade_tracker.git
```

Navigate into the project

```bash
cd student-grade-tracker
```

Install dependencies

```bash
flutter pub get
```

Run the application

```bash
flutter run
```

---

# 📦 Dependencies

| Package       | Purpose          |
|---------------|------------------|
| provider      | State Management |
| flutter_lints | Code Quality     |

---

# ✅ Assignment Requirements

* ✔ Subject model with private `_mark`
* ✔ Grade getter
* ✔ Provider state management
* ✔ No `setState()` usage
* ✔ `List<Subject>`
* ✔ `.map()` implementation
* ✔ `.where()` implementation
* ✔ BottomNavigationBar
* ✔ Three screens
* ✔ Form validation
* ✔ ListView.builder
* ✔ Dismissible delete
* ✔ Live summary updates
* ✔ Custom Light Theme
* ✔ Custom Dark Theme
* ✔ No hardcoded colors
* ✔ Material 3 Design
* ✔ Responsive UI

---

# 👨‍💻 Author

**Md Shahajalal Mahmud**

Flutter Developer • Android Developer • UI/UX Enthusiast

---

