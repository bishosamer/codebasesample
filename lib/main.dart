import 'package:FloorFour/UI/elements/ThemeChanger.dart';
import 'package:FloorFour/UI/mobile/AboutMobile.dart';
import 'package:FloorFour/UI/mobile/ContactPageMobile.dart';
import 'package:FloorFour/UI/mobile/HomePageMobile.dart';
import 'package:FloorFour/UI/mobile/ProjectPageMobile.dart';
import 'package:FloorFour/UI/pages/About.dart';
import 'package:FloorFour/UI/pages/ContactPage.dart';
import 'package:FloorFour/UI/pages/HomePage.dart';
import 'package:FloorFour/UI/pages/ProjectScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cursor/flutter_cursor.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:FloorFour/UI/elements/Cursor.dart' as c;
import 'package:provider/provider.dart';
import 'package:universal_html/prefer_sdk/html.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // static final appContainer =
  //     window.document.getElementById('flutter_container');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //   appContainer.className = 'green';

    return ChangeNotifierProvider<ThemeChange>(
        create: (context) => ThemeChange(),
        child: Consumer<ThemeChange>(builder: (context, themechange, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'FloorFour',
            theme: ThemeData(
              unselectedWidgetColor: themechange.accentColor,
              accentColor: themechange.accentColor,
              backgroundColor: Color(0xff131313),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: '/',
            onGenerateRoute: (settings) {
              final args = settings.arguments;
              switch (settings.name) {
                case '/about':
                  return MaterialPageRoute(
                      builder: (context) => ScreenTypeLayout(
                            desktop: c.Cursor(
                              child: AboutPage(),
                              context: context,
                            ),
                            mobile: AboutMobile(),
                          ));
                case '/':
                  return MaterialPageRoute(
                      builder: (context) => ScreenTypeLayout(
                          mobile: MobileHome(),
                          desktop: c.Cursor(
                            child: HomePage(),
                            context: context,
                          )));
                case '/projects':
                  return MaterialPageRoute(
                      builder: (context) => ScreenTypeLayout(
                            desktop: c.Cursor(
                              child: ProjectScreen(index: args),
                              context: context,
                            ),
                            mobile: ProjectPageMobile(
                              index: args,
                            ),
                          ));
                case '/contact':
                  return MaterialPageRoute(
                      builder: (context) => ScreenTypeLayout(
                          mobile: ContactPageMobile(
                            index: args,
                          ),
                          desktop: c.Cursor(
                            child: ContactPage(
                              index: args,
                            ),
                            context: context,
                          )));
                default:
                  return MaterialPageRoute(
                      builder: (context) =>
                          ScreenTypeLayout(desktop: HomePage()));
              }
            },
          );
        }));
  }
}
