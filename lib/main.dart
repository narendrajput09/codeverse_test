
import 'package:codeverse/app/routes/app_pages.dart';
import 'package:codeverse/app/routes/app_routes.dart';
import 'package:codeverse/l10n/localization.dart';
import 'package:codeverse/utils/app_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';


Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();




 var authToken = await AppPreference().get(AppPreference.KEY_REGISTER_TOKEN);

  var initialRoute = AppRoutes.signInSignUpFlow;


  if (authToken != null && authToken.isNotEmpty) {
    initialRoute = AppRoutes.homeScreen;
  } else {
    initialRoute = AppRoutes.signInSignUpFlow;
  }
  runApp(MyApp(
    initialRoute: initialRoute,
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.initialRoute,
  }) : super(key: key);

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'codeverse',
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: AppPages.routes,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],

    );
  }
}
