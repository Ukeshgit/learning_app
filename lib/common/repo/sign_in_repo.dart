import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learner/common/entities/entities.dart';
import 'package:learner/common/services/http_util.dart';

class SignInRepo {
  static Future<UserCredential> signIn(String email, String password) async {
    final credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credentials;
  }

  static login(LoginRequestEntity params) {
    var response = HttpUtil().post(
      path: '/api/login',
      queryParameters: params.toJson(),
    );
    // return UserLoginResponseEntity(code, msg, data)
  }
}
