class ObscureState {
  bool isObscured;
  ObscureState({this.isObscured = true});
  ObscureState copyWith({bool? isObscured}) {
    return ObscureState(isObscured: isObscured ?? this.isObscured);
  }
}
