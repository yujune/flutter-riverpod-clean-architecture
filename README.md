# flutter_clean_architecture

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project Structure

- Riverpod and flutter_hooks are used as state management tool and act as "Controller" and "ViewModel" to bring data from model to view.
- All application reusable logic will be added into "Module" class while business logic will be added to "Entities" or "UseCase" class to achieve clean architecture.
