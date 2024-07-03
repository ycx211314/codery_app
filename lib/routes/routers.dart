import '/pages/sign_up/sign_up_page.dart';
import '/pages/sign_in/sign_in_page.dart';

var staticRoutes = {
  // "/":(context)=>HomePage(),
  "/sign_in": (context) => SignInPage(onResult: (success) {
        print(success);
      }),
  "/sign_up": (context) => const SignUpPage(),
  // "/home":(context)=>HomePage(),
  // "/home/detail":(context)=>DetailPage(),
  // "/home/detail/comment":(context)=>CommentPage(),
  // "/home/detail/comment/reply":(context)=>ReplyPage(),
  // "/home/detail/comment/reply/reply":(context)=>
};
