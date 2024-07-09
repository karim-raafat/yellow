import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yellow/pages/cart_page.dart';
import 'package:yellow/pages/checkout_page.dart';
import 'package:yellow/pages/cloth_page.dart';
import 'package:yellow/pages/home_page.dart';
import 'package:yellow/pages/profile_page.dart';
import 'package:yellow/pages/thank_you_page.dart';

import 'provider/app_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      routerConfig: _route,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }

  final _route = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          path: HomePage.routeName,
          name: HomePage.routeName,
          builder: (context, state) => HomePage(),
          routes: [
            GoRoute(
              path: ProfilePage.routeName,
              name: ProfilePage.routeName,
              builder: (context,state) => ProfilePage(),
            ),
            GoRoute(
              path: ClothPage.routeName,
              name: ClothPage.routeName,
              builder: (context,state) => ClothPage(cloth: Provider.of<AppProvider>(context,listen: false).chosenCloth),
            ),
            GoRoute(
              path: CartPage.routeName,
              name: CartPage.routeName,
              builder: (context,state) => CartPage(),
            ),
            GoRoute(
              path: CheckoutPage.routeName,
              name: CheckoutPage.routeName,
              builder: (context,state) => CheckoutPage(),
            ),
            GoRoute(
              path: ThankYouPage.routeName,
              name: ThankYouPage.routeName,
              builder: (context,state) => ThankYouPage(),
            ),

          ]),
    ],
  );
}
