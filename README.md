# 🇮🇩 Covid-19 Indonesia Tracker

<div align="center">
  <img src="Screenshoot/banner.jpg" width="100%" alt="Covid-19 Indonesia Banner">
  <br>
  <h1>A Comprehensive Flutter App for Real-Time Pandemic Monitoring</h1>
</div>

<div align="center">
  
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Provider](https://img.shields.io/badge/Provider-State%20Management-blue?style=for-the-badge)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)

</div>

---

## 📖 Overview

**Covid-19 Indonesia** is a sleek, user-friendly mobile application developed with Flutter to provide accurate and up-to-date information on the Covid-19 pandemic in Indonesia. It aggregates data from reliable sources to present key metrics, provincial breakdowns, and hospital availability in an intuitive interface.

## ✨ Key Features

- **📊 Real-Time Dashboard**: Monitor total confirmed cases, recoveries, and deaths with live updates.
- **🗺️ Provincial Data**: Explore detailed statistics for all 34 provinces in Indonesia. Search and sort capabilities included.
- **🏥 Hospital Directory**: Access a comprehensive list of referral hospitals with contact details and addresses.
- **📈 Interactive Analytics**: Visualize trends through dynamic charts (Daily Cases, Age Groups, Gender Distribution).
- **📱 Responsive UI**: A modern, clean design optimized for various device sizes.

## 📸 App Preview

<div align="center" style="display: flex; justify-content: center; gap: 20px;">
  <img src="Demo/Home.gif" width="250" alt="Home Screen Demo" style="border-radius: 10px; box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);">
  <img src="Demo/Provinsi.gif" width="250" alt="Province Screen Demo" style="border-radius: 10px; box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);">
  <img src="Demo/Rumah-sakit.gif" width="250" alt="Hospital Screen Demo" style="border-radius: 10px; box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);">
</div>

## 🛠️ Technology Stack

- **Framework**: [Flutter](https://flutter.dev) (Dart 3.x)
- **State Management**: [Provider](https://pub.dev/packages/provider)
- **Networking**:
  - [Dio](https://pub.dev/packages/dio) (HTTP Client)
  - [Connectivity Plus](https://pub.dev/packages/connectivity_plus) (Network Status)
- **Visualization**: [Community Charts Flutter](https://pub.dev/packages/community_charts_flutter)
- **Icons & Design**: Font Awesome Flutter, Cupertino Icons, Google Fonts (Poppins)

## ⚙️ Minimum Requirements

To build and run this project locally, ensure your development environment meets the following criteria:

| Component       | Requirement        | Notes                       |
| :-------------- | :----------------- | :-------------------------- |
| **Flutter SDK** | `>=3.0.0`          | Tested with Flutter 3.x     |
| **Dart SDK**    | `>=3.0.0`          | Compatible with Dart 3      |
| **Java**        | `JDK 17` or higher | Required for Gradle 8.x     |
| **Android SDK** | `API 34`           | Android 14 (UpsideDownCake) |

## 🚀 How to Run

Follow these steps to get the app running on your machine:

### 1. Clone the Repository

```bash
git clone https://github.com/AloisiusBagas/Covid19-Indonesia.git
cd Covid19-Indonesia
```

### 2. Install Dependencies

Fetch all the required packages listed in `pubspec.yaml`:

```bash
flutter pub get
```

### 3. Run the App

Connect your Android device or start an emulator, then execute:

```bash
flutter run
```

> **Pro Tip**: If you encounter build issues, try cleaning the build cache first:
>
> ```bash
> flutter clean
> flutter pub get
> flutter run
> ```

## 👨‍💻 Author

Developed with ❤️ by **[Aloisius Bagas](https://github.com/AloisiusBagas)**.

---

_If you find this project useful, please consider giving it a ⭐ on GitHub!_
