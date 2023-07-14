import 'package:flutter/material.dart';
import 'package:gobot_ai/pages/change_password.dart';
import 'package:gobot_ai/pages/chat_page.dart';
import 'package:gobot_ai/pages/page_selector.dart';
import 'package:gobot_ai/utils/custom_route.dart';
import 'pages/pages.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case "/":
        return CustomPageRouteWithTransitionAnimation(
          enterWidget: const SplashScreen(),
        );
      case "/onboarding":
        return CustomPageRouteWithTransitionAnimation(
          // transitionDurationinMIliSeconds: 3000,
          // enterWidget: const Onboarding(),
          enterWidget: const PageSelector()
          // transitionDurationinMIliSeconds: 3000,
        );
      case "/sign-up":
        return CustomPageRouteWithTransitionAnimation(
          enterWidget: const SignUp(),
        );
      case "/log-in":
        return CustomPageRouteWithTransitionAnimation(
          enterWidget: const LoginPage(),
        );
      case "/forgot-password":
        return CustomPageRouteWithTransitionAnimation(
          enterWidget: const ForgotPasswordPage(),
        );
      case "/update-profile":
        return CustomPageRouteWithTransitionAnimation(
          enterWidget: const UpdateProfilePage(),
        );
      case "/home":
        return CustomPageRouteWithTransitionAnimation(
          enterWidget: const PageSelector(),
        );
      case "/change-password":
        return CustomPageRouteWithTransitionAnimation(
          enterWidget: const ChangePassword(),
        );
      case "/chat-page":
      final argument = settings.arguments;
      if(argument != null && argument is Map<String, dynamic>){
final name = argument["name"];
        return CustomPageRouteWithTransitionAnimation(
          enterWidget:NewChatPage(
            botName: name,
          ),
        );}
        else{
          return _errorRoute();
        }
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return CustomPageRouteWithTransitionAnimation(
      enterWidget: const Scaffold(
          body: Center(
        child: Text("Error Page please navigate back"),
      )),
    );
  }
}
