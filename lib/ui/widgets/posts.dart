import 'package:flutter/material.dart';
import 'package:flutterprovidersample/core/constants/app_contstants.dart';
import 'package:flutterprovidersample/core/models/user.dart';
import 'package:flutterprovidersample/core/services/api.dart';
import 'package:flutterprovidersample/core/viewmodels/posts_model.dart';
import 'package:flutterprovidersample/ui/views/base_widget.dart';
import 'package:flutterprovidersample/ui/widgets/postlist_item.dart';
import 'package:provider/provider.dart';

class Posts extends StatelessWidget {
  const Posts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = context.select((User p) => p.id);
    return BaseWidget<PostsModel>(
      model: PostsModel(api: context.watch<Api>()),
      onModelReady: (model) => model.getPosts(id),
      builder: (_context, model, child) => model.busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: model.posts.length,
              itemBuilder: (context, index) => PostListItem(
                post: model.posts[index],
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePaths.Post,
                    arguments: model.posts[index],
                  );
                },
              ),
            ),
    );
  }
}
