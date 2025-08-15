# flavors

A flavored Flutter app with Student (Kids App) and Teacher (Tutor App) variants, localization, basic onboarding/login, orientation handling (Soroban in landscape), and CI workflows.

## Run

- Student: `flutter run --flavor student -t lib/main_student.dart`
- Teacher: `flutter run --flavor teacher -t lib/main_teacher.dart`

## Build

- Android APK: `flutter build apk --flavor student -t lib/main_student.dart`
- Android AAB: `flutter build appbundle --flavor teacher -t lib/main_teacher.dart`

CI workflows are in `.github/workflows/`.
