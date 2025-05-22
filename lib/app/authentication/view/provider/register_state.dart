class RegisterState {
  String userName;
  String email;
  String password;
  String rePassword;
  RegisterState({
    this.userName = "",
    this.email = "",
    this.password = "",
    this.rePassword = "",
  });

  RegisterState copywith({
    String? userName,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return RegisterState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
    );
  }
}
