import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:my_clean/core/constants/url_constants.dart';
import 'package:my_clean/core/errors/exceptions.dart';
import 'package:my_clean/features/posts/data_layer/models/post_model.dart';
import 'package:http/http.dart' as http;

abstract class RemotePostDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> addPost(PostModel post);
  Future<Unit> deletePost(int id);
  Future<Unit> updatePost(PostModel post);
}

class RemotePostDataSourceImpl implements RemotePostDataSource {
  final http.Client client;

  RemotePostDataSourceImpl({required this.client});

  @override
  Future<List<PostModel>> getAllPosts() async {
    Uri url = Uri.parse(postsAllPosts);

    http.Response response =
        await client.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      String json = response.body;
      List<dynamic> postsMaps = jsonDecode(json);
      List<PostModel> posts =
          postsMaps.map<PostModel>((e) => PostModel.fromMap(e)).toList();
      return posts;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPost(PostModel post) async {
    Map<String, dynamic> myMap = post.toMap();

    String myJson = json.encode(myMap);

    Uri url = Uri.parse(postsAllPosts);

    http.Response response = await client.post(url, body: myJson);

    if (response.statusCode == 201) {
      return unit;
      // or  return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost(int id) async {
    Uri url = Uri.parse("$postsAllPosts/${id.toString()}");
    http.Response response =
        await client.delete(url, headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      return unit;
      // or return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost(PostModel post) async {
    Map<String, dynamic> myMap = post.toMap();
    Uri url = Uri.parse("$postsAllPosts/${post.id}");

    String myJson = json.encode(myMap);

    http.Response response = await client.patch(url, body: myJson);
    if (response.statusCode == 200) {
      return unit;
      // or  return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
