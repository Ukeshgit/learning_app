import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learner/app/authentication/model/obscure_state.dart';

class ObscureNotifier extends StateNotifier<ObscureState> {
  ObscureNotifier() : super(ObscureState());

  void toggleObscure() {
    state = state.copyWith(isObscured: !state.isObscured);
  }
}

final obscureProvider = StateNotifierProvider<ObscureNotifier, ObscureState>(
  (ref) => ObscureNotifier(),
);

final SigninobscureProvider =
    StateNotifierProvider<ObscureNotifier, ObscureState>(
      (ref) => ObscureNotifier(),
    );
