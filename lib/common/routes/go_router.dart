import 'package:go_router/go_router.dart';
import 'package:learner/app/Dashboard/view/pages/dashboard_screen.dart';
import 'package:learner/app/authentication/view/pages/sign_in_screen.dart';
import 'package:learner/app/authentication/view/pages/sign_up_screen.dart';
import 'package:learner/app/welcome/view/screen/welcome_screen.dart';
import 'package:learner/main.dart';

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => WelcomeScreen()),
    GoRoute(path: '/signIn', builder: (context, state) => SignInScreen()),
    GoRoute(path: '/signUp', builder: (context, state) => SignUpScreen()),
    GoRoute(path: '/home', builder: (context, state) => MyHomePage()),
    GoRoute(path: '/dashboard', builder: (context, state) => DashboardScreen()),
  ],
);
