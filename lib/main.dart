import 'package:flutter/material.dart';
import 'package:flutterprovidersample/provider_setup.dart';
import 'package:flutterprovidersample/ui/router.dart';
import 'package:flutterprovidersample/ui/shared/app_colors.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_contstants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: backgroundColor,
        ),
        initialRoute: RoutePaths.Login,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
