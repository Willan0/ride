class Validation {
  static String? userNameValidation(String? value) {
    if (value?.isEmpty ?? false) {
      return "Invalid userName";
    }
    if (value!.trim().length < 4) {
      return "your name must be at least 4";
    }
    return null;
  }

  static String? phoneValidation(String? value) {
    if (value?.isEmpty ?? false) {
      return "Invalid phone";
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    if (value?.isEmpty ?? false) {
      return "Invalid password";
    }
    if (value!.trim().length < 8) {
      return "your name must be at least 8";
    }
    if (!(value.contains("@") || value.contains("\$") || value.contains("#"))) {
      return "password must contain special characters e.g(@,\$,#)";
    }
    return null;
  }

  static String? emailValidation(String? value) {
    if (value?.isEmpty ?? false || !(value!.contains("@"))) {
      return "Invalid email";
    }
    return null;
  }
}
