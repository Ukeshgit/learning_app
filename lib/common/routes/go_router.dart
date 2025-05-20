import 'package:go_router/go_router.dart';
import 'package:learner/app/authentication/view/pages/sign_in_screen.dart';
import 'package:learner/app/welcome/view/screen/welcome_screen.dart';

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => WelcomeScreen()),
    GoRoute(path: '/signIn', builder: (context, state) => SignInScreen()),
  ],
);
