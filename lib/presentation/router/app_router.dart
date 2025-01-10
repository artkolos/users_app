import 'package:auto_route/auto_route.dart';
import 'package:users_app/presentation/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.slideLeft,
          page: UsersListRoute.page,
          initial: true,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.slideLeft,
          page: UserDetailInfoRoute.page,
        ),
      ];
}
