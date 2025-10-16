part of 'post_api_bloc.dart';

@immutable
class PostApiState extends Equatable {
  final PostStatus postStatus;
  final List<Post> comments;
  final String message;

  const PostApiState({this.postStatus = PostStatus.loading, this.comments = const [], this.message = ''});

  PostApiState copyWith({PostStatus? postStatus, List<Post>? comments, String? message}) {
    return PostApiState(postStatus: postStatus ?? this.postStatus, comments: comments ?? this.comments, message: message ?? this.message);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [postStatus, comments, message];
}
