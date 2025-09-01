# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter application for Figma Dev Mode samples. It's a standard Flutter project with iOS, Android, and Web platform support.

## Essential Commands

### Development Commands
- `flutter run` - Run the app in development mode with hot reload
- `flutter run -d chrome` - Run on web browser
- `flutter run -d ios` - Run on iOS simulator
- `flutter run -d android` - Run on Android emulator

### Testing and Quality
- `flutter test` - Run all unit and widget tests
- `flutter analyze` - Run static analysis and linting
- `flutter pub get` - Install dependencies

### Build Commands
- `flutter build apk` - Build Android APK
- `flutter build ios` - Build iOS app
- `flutter build web` - Build web app

## Project Structure

- `lib/main.dart` - Entry point with MaterialApp and counter demo
- `test/widget_test.dart` - Widget tests for the main app
- `pubspec.yaml` - Dependencies and project configuration
- `analysis_options.yaml` - Dart analyzer configuration using flutter_lints
- `android/` - Android-specific platform code
- `ios/` - iOS-specific platform code  
- `web/` - Web-specific assets and configuration

## Architecture

This is a standard Flutter app using:
- Material Design components
- StatefulWidget for state management (counter example)
- Standard Flutter project structure with platform folders

The main app (`MyApp`) contains a `MyHomePage` with a simple counter implementation demonstrating Flutter's reactive UI updates through `setState()`.

