import 'package:flutter/material.dart';
import 'package:flutterprovidersample/core/models/post.dart';
import 'package:flutterprovidersample/core/models/user.dart';
import 'package:flutterprovidersample/ui/shared/app_colors.dart';
import 'package:flutterprovidersample/ui/shared/text_styles.dart';
import 'package:flutterprovidersample/ui/shared/ui_helpers.dart';
import 'package:flutterprovidersample/ui/widgets/comments.dart';
import 'package:provider/provider.dart';

class PostView extends StatefulWidget {
  final Post post;

  const PostView({Key key, this.post}) : super(key: key);

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    final name = context.select((User p) => p.name);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge,
            Text(widget.post.title, style: headerStyle),
            Text(
              'by $name',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium,
            Text(widget.post.body),
            Comments(widget.post.id)
          ],
        ),
      ),
    );
  }
}
