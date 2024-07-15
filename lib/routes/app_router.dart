import 'package:auto_route/auto_route.dart';
import 'package:codery/pages/application/application_page.dart';
import 'package:codery/pages/demo/demo_page.dart';
import 'package:codery/pages/im/conversations/conversation_page.dart';
import 'package:codery/pages/profile/profile_page.dart';
import 'package:codery/pages/sample/sliver_app_bar_demo_page.dart';
import 'package:codery/pages/sign_in/forget_password/forget_password_page.dart';
import 'package:codery/pages/sign_in/reset_password/reset_password_page.dart';
import 'package:codery/pages/sign_in/sign_in_page.dart';
import 'package:codery/pages/sign_up/sign_up_page.dart';
import 'package:codery/routes/auth_guard.dart';
import 'package:flutter/material.dart';

import '../pages/im/contacts/contact_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        /// AutoRoute(path: '', page: UsersRoute.page),
        AutoRoute(path: '/', page: ApplicationRoute.page, initial: true),
        AutoRoute(path: '/login', page: SignInRoute.page),
        AutoRoute(path: '/contact', page: ContactsRoute.page),
        AutoRoute(path: '/contasct', page: ConversationRoute.page),
        AutoRoute(path: '/register', page: SignUpRoute.page),
        AutoRoute(path: '/forgetPassword', page: ForgetPasswordRoute.page),
        AutoRoute(path: '/resetPassword', page: ResetPasswordRoute.page),
        AutoRoute(
            path: '/sliverApp', page: SliverApp.page, guards: [AuthGuard()]),
      ];
}
