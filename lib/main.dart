import 'package:fantasy11_flutter/ui/splash/splash_screen.dart';
import 'package:fantasy11_flutter/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'ui/home/home_screen.dart';
import 'utils/routes.dart';



// 

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AttackApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: primaryColorLight, // status bar color
  ));
}

class AttackApp extends StatelessWidget {
  static final homeSingleton = GlobalKey<HomeScreenState>();

  const AttackApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget!),
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
            background: Container(color: Colors.grey.withOpacity(0.7))),
        initialRoute: Routes.splash,
        onGenerateRoute: (RouteSettings settings) {
          return Routes.fadeThrough(settings, (context) {
            switch (settings.name) {
              case Routes.splash:
                return const SplashScreen();
              default:
                return const SizedBox.shrink();
            }
          });
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark());
  }
}
