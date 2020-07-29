import 'package:flutter/material.dart';
import 'package:flutterprovidersample/core/models/user.dart';
import 'package:flutterprovidersample/ui/shared/app_colors.dart';
import 'package:flutterprovidersample/ui/shared/text_styles.dart';
import 'package:flutterprovidersample/ui/shared/ui_helpers.dart';
import 'package:flutterprovidersample/ui/widgets/posts.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final name = context.select((User p) => p.name);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UIHelper.verticalSpaceLarge,
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Welcome $name',
              style: headerStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Here are all your posts', style: subHeaderStyle),
          ),
          UIHelper.verticalSpaceSmall,
          Expanded(
            child: Posts(),
          )
        ],
      ),
    );
  }
}
