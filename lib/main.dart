import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:football/app_binding.dart';
import 'package:football/firebase_options.dart';
import 'package:football/modules/auth/auth_binding.dart';
import 'package:football/modules/auth/auth_page.dart';
import 'package:football/modules/detail_match/detail_match_binding.dart';
import 'package:football/modules/detail_match/detail_match_page.dart';
import 'package:football/modules/main/main_binding.dart';
import 'package:football/modules/main/main_page.dart';
import 'package:football/modules/search/search_binding.dart';
import 'package:football/modules/search/search_page.dart';
import 'package:football/style/theme.dart';
import 'package:football/translation/translation.dart';
import 'package:get/get.dart';

import 'modules/intro/intro_binding.dart';
import 'modules/intro/intro_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    GetMaterialApp(
      theme: darkTheme,
      locale: const Locale('en'),
      translations: Translation(),
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/intro',
      getPages: [
        GetPage(
          name: '/intro',
          page: () => const IntroPage(),
          binding: IntroBinding(),
        ),
        GetPage(
          name: '/auth',
          page: () =>  AuthPage(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/main',
          page: () => const MainPage(),
          binding: MainBinding(),
        ),
        GetPage(
          name: '/search',
          page: () => const SearchPage(),
          binding: SearchBinding(),
        ),
        GetPage(
          name: '/search',
          page: () => const SearchPage(),
          binding: SearchBinding(),
        ),
        GetPage(
          name: '/detail_match',
          page: () =>  const DetailMatchPage(),
          binding: DetailMatchBinding(),
        ),
      ],
    ),
  );
}
