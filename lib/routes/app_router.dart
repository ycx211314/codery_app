import 'package:auto_route/auto_route.dart';
import 'package:codery/pages/application/application_page.dart';
import 'package:codery/pages/demo/demo_page.dart';
import 'package:codery/pages/sign_in/sign_in_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          path: '/dashboard',
          page: ApplicationRoute.page,
          children: [
            AutoRoute(path: 'demo', page: DemoRoute.page),
          ],
        ),
        AutoRoute(path: '/login', page: SignInRoute.page),
      ];
}
