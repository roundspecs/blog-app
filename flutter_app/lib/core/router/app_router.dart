import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/screens.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: LoginPage.route,
  routes: <RouteBase>[
    GoRoute(
      path: SignupPage.route,
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: LoginPage.route,
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
