import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_navIndex.g.dart';

@riverpod
class AppNavindex extends _$AppNavindex {
  @override
  int build() => 0;
  void changeIndex(int index) {
    state = index;
  }
}
