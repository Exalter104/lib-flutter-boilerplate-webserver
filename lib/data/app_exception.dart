class AppException implements Exception {
  final _message;
  final _prefix;

  AppException(this._message, this._prefix);
  @override
  String toString() {
    return "$_prefix$_message";
  }
}

// network connection issue this error will appear

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication");
}

// urls are wrong or missing some words

class BadrequestException extends AppException {
  BadrequestException([String? message]) : super(message, "Invalid Request");
}

// user is verified with token-base if not then this will appear

class UnautherisedException extends AppException {
  UnautherisedException([String? message])
      : super(message, "Unautherised Request");
}

// user input are wrong then show this error will appear

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Inputs");
}
