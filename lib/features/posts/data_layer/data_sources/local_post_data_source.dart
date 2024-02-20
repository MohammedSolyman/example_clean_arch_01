import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:my_clean/core/constants/url_constants.dart';
import 'package:my_clean/core/errors/exceptions.dart';
import 'package:my_clean/features/posts/data_layer/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalPostDataSource {
  Future<List<PostModel>> getcache();
  Future<Unit> saveCache(List<PostModel> posts);
}

class LocalPostDataSourceImpl implements LocalPostDataSource {
  final SharedPreferences sharedPreferences;

  LocalPostDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> saveCache(List<PostModel> posts) async {
    List<dynamic> myMaps =
        posts.map<Map<String, dynamic>>((e) => e.toMap()).toList();
    String json = jsonEncode(myMaps);
    await sharedPreferences.setString(postsCache, json);
    return unit;
  }

  @override
  Future<List<PostModel>> getcache() {
    String? json = sharedPreferences.getString(postsCache);

    if (json != null) {
      List<dynamic> myMaps = jsonDecode(json);
      List<PostModel> localPosts =
          myMaps.map<PostModel>((e) => PostModel.fromMap(e)).toList();

      return Future.value(localPosts);
    } else {
      throw CacheException();
    }
  }
}
