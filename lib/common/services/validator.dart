class FieldValidator {
  static bool checkButtonIsActive(String title, String author) {
    if (title.isEmpty) return false;
    if (author.isEmpty) return false;
    return true;
  }
}
