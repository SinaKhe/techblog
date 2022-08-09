import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog_app_3/component/my_colors.dart';
import 'package:tech_blog_app_3/view/main_screen.dart';
// import 'package:tech_blog_app_3/view/my_cats.dart';
// import 'package:tech_blog_app_3/view/register_intro.dart';
// import 'package:tech_blog_app_3/view/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: SolidColors.statusBarColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: SolidColors.systemNavigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // farsi
      ],
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(width: 2)),
              filled: true,
              fillColor: Colors.white),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return textTheme.headline1;
                }
                return textTheme.subtitle1;
              }),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return SolidColors.titleandseeColor;
                }
                return SolidColors.primeryColor;
              }),
            ),
          ),

          //
          fontFamily: 'dana',
          brightness: Brightness.light,
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontFamily: 'dana',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: SolidColors.posterTitleColor,
            ),
            subtitle1: TextStyle(
              fontFamily: 'dana',
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: SolidColors.posterSubTitleColor,
            ),
            bodyText1: TextStyle(
                fontFamily: 'dana', fontSize: 13, fontWeight: FontWeight.w300),
            headline2: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w300),

            //
            headline3: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                color: SolidColors.titleandseeColor,
                fontWeight: FontWeight.w700), //headline3 red color

            //
            headline4: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                color: Color.fromARGB(255, 70, 70, 70),
                fontWeight: FontWeight.w700),

            //
            headline5: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                color: SolidColors.hintTextColor,
                fontWeight: FontWeight.w700),
          )), // headline4 green color

      debugShowCheckedModeBanner: false,
      // home: const SplashScreen(),
      // home: const RegisterIntro(),
      // home: const MainScreen(),
      // home: const MyCats(),
      home: MainScreen(),
    );
  }
}
