import 'package:football/util/exeption/base_exeprion.dart';
import 'package:football/util/exeption/exeption_type.dart';

class ValidationException extends BaseException {
  final Map<String, dynamic> messages;

  const ValidationException(this.messages) : super(ExceptionType.validation);

  String? getMessageForField(String fieldName) {
    if (messages.containsKey(fieldName)) {
      dynamic message = messages[fieldName];
      if (message is List<dynamic> && message.isNotEmpty) {
        return message.first.toString();
      } else if (message != null) {
        return message.toString();
      }
    }
    return null;
  }
}