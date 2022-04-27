import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vinsartisanmarket/Models/AuthUser.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinsartisanmarket/screens/home/home_screen.dart';
import 'package:vinsartisanmarket/screens/layout.dart';
import 'package:vinsartisanmarket/screens/welcome_screen/welcome_screen.dart';
import 'package:vinsartisanmarket/service/authentication/auth.dart';
import 'package:vinsartisanmarket/service/http_handeler/httpClient.dart';

bool isLoggedIn = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkAuth();
  runApp(const VAM());
}

Future checkAuth() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token') ?? '';
  Map<String, dynamic> user = jsonDecode(prefs.getString('user') ?? '{}');

  if (token.isEmpty) {
    isLoggedIn = false;
  } else {
    httpClient.setToken(token);
    Map res = await httpClient.authCheck();

    if (kDebugMode) {
      print(res);
    }
    if (res['code'] == 401) {
      isLoggedIn = false;
    } else {
      isLoggedIn = true;
      httpClient.setToken(token);
      authUser.setUser(user);
    }
  }
}

class VAM extends StatelessWidget {
  const VAM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VinS Artisan Market',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      home: const WelcomeScreen(),
      // home: isLoggedIn ? const Layout() : const Auth(),
    );
  }
}
