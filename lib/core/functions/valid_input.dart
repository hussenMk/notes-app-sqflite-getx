import 'package:get/get.dart';

import '../constant/messages.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return messageInputEmpty;
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return usernameError;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return emailError;
    }
  }

  if (val.length < min) {
    return "$messageInputMin $min";
  }
  if (val.length > max) {
    return "$messageInputMax $max";
  }
}

validSearch(String val, int min, int max) {
  if (val.isEmpty) {
    return messageSearchEmpty;
  }

  if (val.length < min) {
    return "$messageInputMin $min";
  }

  if (val.length > max) {
    return "$messageInputMax $max";
  }
}
