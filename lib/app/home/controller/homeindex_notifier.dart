import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'homeindex_notifier.g.dart';

@Riverpod(keepAlive: true)
class HomeIndexNotifier extends _$HomeIndexNotifier {
  @override
  int build() => 0;

  void changeIndex(int index) {
    state = index;
  }
}
