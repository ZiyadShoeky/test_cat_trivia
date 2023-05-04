import 'package:hive/hive.dart';
import 'cat_fact.dart';
import 'package:test_cat_trivia/hive_extensions.dart';

class CatFactAdapter extends TypeAdapter<CatFact> {
  @override
  final int typeId = 0;

  @override
  CatFact read(BinaryReader reader) {
    return CatFact(
      fact: reader.readString(),
      createdAt: reader.readDateTime(),
    );
  }

  @override
  void write(BinaryWriter writer, CatFact obj) {
    print('heelo');

    writer.writeString(obj.fact);
    writer.writeDateTime(obj.createdAt);
    print(obj.fact);
  }
}