import 'package:json_annotation/json_annotation.dart';
import 'package:uuid_type/uuid_type.dart';

class UuidConverter<T> implements JsonConverter<Uuid, String> {
  const UuidConverter();

  @override
  Uuid fromJson(Object json) {
    // This will only work if `json` is a native JSON type:
    //   num, String, bool, null, etc
    // *and* is assignable to `T`.
    // if (Uuid.parse(json) == Uuid()) {
    //   return null;
    // } else {
    return Uuid.parse(json.toString());
    // }
  }

  @override
  String toJson(Uuid? object) {
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    if (object == null) {
      return '';
    } else {
      return object.toString();
    }
  }
}
