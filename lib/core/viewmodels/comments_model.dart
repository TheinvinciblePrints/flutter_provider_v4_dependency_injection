import 'package:flutter/widgets.dart';
import 'package:flutterprovidersample/core/models/comment.dart';
import 'package:flutterprovidersample/core/services/api.dart';
import 'package:flutterprovidersample/core/viewmodels/base_model.dart';

class CommentsModel extends BaseModel {
  Api _api;

  CommentsModel({
    @required Api api,
  }) : _api = api;

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setBusy(true);
    comments = await _api.getCommentsForPost(postId);
    setBusy(false);
  }
}
