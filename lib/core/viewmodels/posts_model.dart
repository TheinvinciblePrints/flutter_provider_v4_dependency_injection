import 'package:flutterprovidersample/core/models/post.dart';
import 'package:flutterprovidersample/core/services/api.dart';
import 'package:flutterprovidersample/core/viewmodels/base_model.dart';
import 'package:meta/meta.dart';

class PostsModel extends BaseModel {
  Api _api;

  PostsModel({
    @required Api api,
  }) : _api = api;

  List<Post> posts;

  Future getPosts(int userId) async {
    setBusy(true);
    if (userId != null) {
      posts = await _api.getPostsForUser(userId);
      print('ApiLength: ${posts.length}');
      setBusy(false);
    }
  }
}
