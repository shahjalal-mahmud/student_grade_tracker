                                                   # 📘 Student Grade Tracker - Project Overview

## Project Description

Student Grade Tracker is a Flutter application that allows students to add subjects with marks, automatically calculate grades, view all subjects, and monitor overall academic performance through a live summary dashboard.

## Objectives

* Add subjects with marks (0–100)
* Automatically calculate grades (A, B, C, F)
* Display all subjects in a list
* Show live academic statistics
* Support Light and Dark themes
* Manage all state using Provider

## Assignment Requirements

* Three screens:

    * Add Subject
    * Subject List
    * Summary
* BottomNavigationBar for navigation
* Theme toggle (Light/Dark)
* Subject model with private `_mark` field and `grade` getter
* Store data using `List<Subject>`
* Use `.map()` and `.where()`
* Form validation for subject name and marks
* `ListView.builder` for displaying subjects
* `Dismissible` for swipe-to-delete
* Live summary updates
* Custom `ThemeData` for both themes
* No hardcoded colors (`Theme.of(context)` only)
* Provider as the only state management solution
* **Zero `setState()` calls**

## Technologies Used

* Flutter
* Dart
* Provider
* Material 3

## Outcome

The project demonstrates object-oriented programming, state management with Provider, responsive UI development, form validation, custom theming, and Flutter best practices while satisfying all assignment requirements.
