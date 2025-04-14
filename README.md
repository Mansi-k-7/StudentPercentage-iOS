
# StudentPercentage iOS App

## Overview

The **StudentPercentage** app is a SwiftUI-based iOS application that calculates and displays the percentage of students in different grade groups (A, B, C, D, F). It features a clean interface for data entry and includes a graphical bar chart to visualize the results.

## Features

- Input total number of students and categorize them into 5 groups.
- Computes and displays percentage share of each group.
- Bar graph visualization of group distribution.
- Inline result display via a toast view.
- Simple, user-friendly interface.

## Screens and Functionalities

### 1. Input Screen
- Enter total students.
- Input values for Groups A, B, C, D, and F.
- "Compute" button to calculate percentages.
- "Plot" button navigates to a graph screen.

### 2. Bar Graph Screen
- Visualizes computed percentages using a bar chart with SwiftUI.

## SwiftUI Structure

- `ContentView.swift`: Handles UI, state management, input fields, and computation logic.
- `Computation.swift`: Displays the graphical bar chart of student percentages.
- `StudentPercentageApp.swift`: Entry point of the app with the root view as `ContentView`.

## How It Works

The percentages are calculated as:
```
percentage = (groupCount / totalStudents) * 100
```

Each percentage is passed to the `Computation` view for plotting.

## Example Usage

If a user inputs:
- Total Students: 100
- A: 30, B: 20, C: 25, D: 15, F: 10

The result shown:
```
Group A: 30.00%
Group B: 20.00%
Group C: 25.00%
Group D: 15.00%
Group F: 10.00%
```

Bar chart displays these visually.

## Requirements

- iOS 14.0+
- Swift 5+
- Xcode 12+

## Author

Created by Mansi K on 12/11/24.

