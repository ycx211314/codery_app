import 'package:auto_route/auto_route.dart';
import 'package:codery/data/provider/auth_provider.dart';
import 'package:codery/routes/app_router.dart';
import 'package:provider/provider.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final context = router.navigatorKey.currentContext!;
    // final authProvider = Provider.of<AuthorityProvider>(context, listen: false);

    bool authenticated = true;

    if (authenticated) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
      resolver.redirect(SignInRoute(
        onResult: (success) {
          resolver.next(success);
        },
      ));
    }
  }
}
