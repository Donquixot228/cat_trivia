// This realization i don't use so often. Just for example how to work app_route with locator

import 'package:cat_trivia/pages/pages.dart';
import 'package:cat_trivia/routes/app_rauter.dart';
import 'package:cat_trivia/services/locator.dart';
import 'package:cat_trivia/services/navigation_service.dart';
import 'package:cat_trivia/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainControllerPage extends StatelessWidget {
  const MainControllerPage({super.key});

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const MainControllerPage());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0.0,
        //   automaticallyImplyLeading: false,
        // ),
        extendBodyBehindAppBar: true,
        body: Navigator(
          key: locator<NavigationService>().navigatorKey,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomePage.routeName,
        ),
        bottomNavigationBar: const CustomBottomNavigation(),
      ),
    );
  }
}
