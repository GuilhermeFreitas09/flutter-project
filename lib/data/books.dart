import 'package:hive/hive.dart';

class BookAdapter extends TypeAdapter<Map<String, dynamic>> {
  @override
  final int typeId = 0; // Identificador único para o tipo de dado

  @override
  Map<String, dynamic> read(BinaryReader reader) {
    final numEntries = reader.readByte();
    final map = <String, dynamic>{};
    for (var i = 0; i < numEntries; i++) {
      final key = reader.readString();
      final value = reader.read();
      map[key] = value;
    }
    return map;
  }

  @override
  void write(BinaryWriter writer, Map<String, dynamic> obj) {
    writer.writeByte(obj.length);
    obj.forEach((key, value) {
      writer.writeString(key);
      writer.write(value);
    });
  }
}
