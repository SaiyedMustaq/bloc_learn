class PostModel {
  final List<Post>? posts;
  final int? total;
  final int? skip;
  final int? limit;

  PostModel({this.posts, this.total, this.skip, this.limit});

  PostModel copyWith({List<Post>? posts, int? total, int? skip, int? limit}) =>
      PostModel(posts: posts ?? this.posts, total: total ?? this.total, skip: skip ?? this.skip, limit: limit ?? this.limit);

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    posts: (json['posts'] as List?)?.map((e) => Post.fromJson(e)).toList(),
    total: json['total'],
    skip: json['skip'],
    limit: json['limit'],
  );

  Map<String, dynamic> toJson() => {'posts': posts?.map((e) => e.toJson()).toList(), 'total': total, 'skip': skip, 'limit': limit};
}

class Post {
  final int? id;
  final String? title;
  final String? body;
  final List<String>? tags;
  final Reactions? reactions;
  final int? views;
  final int? userId;

  Post({this.id, this.title, this.body, this.tags, this.reactions, this.views, this.userId});

  Post copyWith({int? id, String? title, String? body, List<String>? tags, Reactions? reactions, int? views, int? userId}) => Post(
    id: id ?? this.id,
    title: title ?? this.title,
    body: body ?? this.body,
    tags: tags ?? this.tags,
    reactions: reactions ?? this.reactions,
    views: views ?? this.views,
    userId: userId ?? this.userId,
  );

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json['id'],
    title: json['title'],
    body: json['body'],
    tags: (json['tags'] as List?)?.map((e) => e as String).toList(),
    reactions: json['reactions'] != null ? Reactions.fromJson(json['reactions']) : null,
    views: json['views'],
    userId: json['userId'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
    'tags': tags?.map((e) => e).toList(),
    'reactions': reactions?.toJson(),
    'views': views,
    'userId': userId,
  };
}

class Reactions {
  final int? likes;
  final int? dislikes;

  Reactions({this.likes, this.dislikes});

  Reactions copyWith({int? likes, int? dislikes}) => Reactions(likes: likes ?? this.likes, dislikes: dislikes ?? this.dislikes);

  factory Reactions.fromJson(Map<String, dynamic> json) => Reactions(likes: json['likes'], dislikes: json['dislikes']);

  Map<String, dynamic> toJson() => {'likes': likes, 'dislikes': dislikes};
}
