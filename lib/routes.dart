import 'package:news_app/pages/sign_in/sign_in.dart';
import 'package:news_app/pages/sign_up/sign_up.dart';

/// 静态路由
var staticRoutes = {
  "/sign-in": (context) => const SignInPage(), // 登录
  "/sign-up": (context) => const SignUpPage(), // 注册
};
