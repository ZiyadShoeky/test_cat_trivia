import 'package:hive/hive.dart';

extension HiveBinaryReaderDateTime on BinaryReader {
  DateTime readDateTime() {
    final int millisecondsSinceEpoch = readInt();
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }
}

extension HiveBinaryWriterDateTime on BinaryWriter {
  void writeDateTime(DateTime dateTime) {
    writeInt(dateTime.millisecondsSinceEpoch);
  }
}