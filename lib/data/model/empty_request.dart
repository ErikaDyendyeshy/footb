import 'to_json_interface.dart';

class EmptyRequest implements ToJsonInterface {
  @override
  Map toJson() => {};
}
