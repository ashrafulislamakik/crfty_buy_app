class Validators {
  static String? validateText(String? value, String message) {
    if ( value == null || value.isEmpty){
      return message;
    }
    return null;
  }

  static String? validateEmail(String? value, String message) {
    final emailRegex =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');

    if (( value == null || value.isEmpty) ||!emailRegex.hasMatch(value)){
      return message;
    }
    return null;
  }

  static String? validatePasswoard(String? value) {

    if ( value == null || value.isEmpty) {
      return " Passwoard is Required";
    } else if (value.length < 6)
    {
      return "Passwoard should at least 6 letters";
    }
  }
}

