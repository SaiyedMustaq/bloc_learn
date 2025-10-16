import 'dart:convert';

import '../models/comments_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<Post>> getComments() async {
    List<Post> posts = [];
    try {
      final response = await http.get(Uri.parse("https://dummyjson.com/posts"));
      print("API RESPONSE ${response.statusCode}");

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final List data = body['posts'] ?? [];

        posts.addAll(data.map((e) => Post.fromJson(e)));
      }
    } catch (ex) {
      print("Error: $ex");
      return [];
    }

    return posts;
  }
}
