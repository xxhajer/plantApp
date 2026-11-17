<p align="center">
  <img src="assets/banner.png" alt="Planto banner" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Swift-5.10-F05138?style=for-the-badge&logo=swift&logoColor=white" alt="Swift">
  <img src="https://img.shields.io/badge/SwiftUI-0A0F0C?style=for-the-badge&logo=swift&logoColor=6FE0B4" alt="SwiftUI">
  <img src="https://img.shields.io/badge/SwiftData-3E8B6B?style=for-the-badge&logo=databricks&logoColor=white" alt="SwiftData">
  <img src="https://img.shields.io/badge/iOS-26-000000?style=for-the-badge&logo=apple&logoColor=white" alt="iOS 26">
  <img src="https://img.shields.io/badge/Architecture-MVVM-E8957A?style=for-the-badge" alt="MVVM">
</p>

<h3 align="center">Your plants, watered on time 🌱</h3>

---

## 🪴 About

**Planto** is a simple iOS app that helps you take care of your plants.
Add each plant with its room, light, and watering schedule, and Planto will remind you when it's time to water it 💧

---

## ✨ Features

| | Feature | Description |
|:-:|---|---|
| 🌱 | **Welcome screen** | Shown only the first time you open the app |
| ➕ | **Add a plant** | Name, room, light, watering days, and water amount |
| ✏️ | **Edit a plant** | Tap any plant to update its details |
| 🗑️ | **Delete a plant** | Swipe to delete, or use the delete button inside the edit page |
| ✅ | **Mark as watered** | Tap the circle next to a plant |
| 📊 | **Daily progress** | A progress bar that fills up as you water your plants |
| 🎉 | **All done** | A happy screen when every plant has been watered |
| 🔔 | **Reminders** | Local notifications that repeat based on each plant's watering days |
| 💾 | **Saved on device** | Plants are stored locally with SwiftData |

---

## 📱 Screenshots

<table align="center">
  <tr>
    <td align="center"><img src="assets/01-welcome.png" width="180"><br><sub><b>Welcome</b></sub></td>
    <td align="center"><img src="assets/02-dashboard.png" width="180"><br><sub><b>My Plants</b></sub></td>
    <td align="center"><img src="assets/03-set-reminder.png" width="180"><br><sub><b>Set Reminder</b></sub></td>
    <td align="center"><img src="assets/04-edit-reminder.png" width="180"><br><sub><b>Edit Reminder</b></sub></td>
    <td align="center"><img src="assets/05-all-done.png" width="180"><br><sub><b>All Done</b></sub></td>
  </tr>
</table>

---

## 🔄 User Flow

```mermaid
flowchart LR
    A([Start]) --> B[Splash]
    B --> C{New user?}
    C -- Yes --> D[Welcome<br/>Empty State]
    C -- No --> E[My Plants]
    D --> E
    E --> F[Add Reminder]
    E --> G[Edit Reminder]
    E --> H[Delete Reminder]
    G --> F
    F --> I[/Enter plant details/]
    I --> J{Save?}
    J -- Save --> E
    J -- Cancel --> E

    style A fill:#3E8B6B,color:#fff,stroke:#3E8B6B
    style C fill:#E8957A,color:#fff,stroke:#E8957A
    style J fill:#E8957A,color:#fff,stroke:#E8957A
    style E fill:#6FE0B4,color:#0A0F0C,stroke:#6FE0B4
```

---

## 🛠️ Tech Stack

| Tool | Used for |
|---|---|
| **SwiftUI** | Building all the screens |
| **SwiftData** | Saving plants on the device |
| **UserNotifications** | Scheduling watering reminders |
| **AppStorage** | Remembering if the user opened the app before |
| **MVVM** | Organizing the code |

---

## 🗂️ Project Structure

```
plantApp
├── 📁 Model
│   └── plantsClass.swift          # Plant model + Room, Light, WateringDay, Water enums
├── 📁 Services
│   └── NotificationService.swift  # Ask permission, schedule & cancel reminders
├── 📁 ViewModel
│   └── PlantViewModel.swift       # Add, update, delete plants
├── 📁 Views
│   ├── StartYourPlantJourney.swift
│   ├── NoReminders.swift          # Dashboard (My Plants)
│   └── SetReminder.swift          # Add & edit sheet
├── MyApp.swift
└── Assets
```

```
View  ──►  ViewModel  ──►  NotificationService  ──►  iOS 🔔
               │
               └──►  SwiftData 💾
```

---

## 🚀 Getting Started

1. Clone the repo
   ```bash
   git clone https://github.com/<your-username>/<repo-name>.git
   ```
2. Open `plantApp.xcodeproj` in **Xcode 26**
3. Choose an iPhone simulator and press **Run** ▶️
4. Allow notifications when asked 🔔

---

<p align="center">
  Made with 💚 by <b>Hajer</b>
</p>
