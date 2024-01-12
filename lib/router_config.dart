import 'package:codingtest/data/repos/auth_repo.dart';
import 'package:codingtest/ui/screens/auth/welcome_screen.dart';
import 'package:codingtest/ui/screens/dashboard/dashboard_screen.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(routes: [
  GoRoute(
      path: '/',
      name: '/',
      builder: (_, __) => const DashboardScreen(),
      redirect: (_, routerstate) {
        if (PrefsAuth().userData == null) {
          return '/welcome';
        }
        return routerstate.fullPath;
      }),
  GoRoute(
      path: '/welcome',
      name: 'welcome',
      builder: (_, __) => const WelcomeScreen())
]);
