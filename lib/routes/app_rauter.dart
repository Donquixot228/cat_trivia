import 'dart:developer';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    log('This is route : ${settings.name}');
    switch (settings.name) {
      // case HomePage.routeName:
      //   return _FadeRoute(child: HomePage.create(), time: 0);
      // case SearchUserPage.routeName:
      //   return _FadeRoute(child: SearchUserPage.create(), time: 0);
      // case ProfilePage.routeName:
      //   return _FadeRoute(child: ProfilePage.create(), time: 0);
      // case LocationPage.routeName:
      //   return _FadeRoute(child: LocationPage.create(), time: 0);
      // case SearchedUserPage.routeName:
      //   return _FadeRoute(child: SearchedUserPage.create(), time: 0);
      // case ChatPage.routeName:
      //   return _FadeRoute(child: ChatPage.create(), time: 0);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final int time;

  _FadeRoute({
    required this.child,
    required this.time,
  }) : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                child,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                FadeTransition(
                  opacity: animation,
                  child: child,
                ),
            transitionDuration: Duration(milliseconds: time));
}
