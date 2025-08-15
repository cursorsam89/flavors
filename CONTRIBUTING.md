## Contributing

- Use feature branches and open PRs against `main`.
- CI runs analyze and tests on every PR.
- Bump `version:` in `pubspec.yaml` to trigger release builds on merge to main.
- Run locally with flavors:
  - Student: `flutter run --flavor student -t lib/main_student.dart`
  - Teacher: `flutter run --flavor teacher -t lib/main_teacher.dart`
- Keep code formatted and passing `flutter analyze`.