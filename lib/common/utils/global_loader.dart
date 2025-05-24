import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'global_loader.g.dart';

@riverpod
class Apploader extends _$Apploader {
  @override
  bool build() => false; //use fat arrow always

  void setLoaderValue(bool value) {
    state =
        value; //it means the state object is shared resources . That shared object will be changed to value
  }
}
