import 'package:bloc/bloc.dart';
import 'package:bloc_app/simple_example/models/comments_model.dart';
import 'package:bloc_app/simple_example/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../repository/post_repository.dart';

part 'post_api_event.dart';
part 'post_api_state.dart';

class PostApiBloc extends Bloc<PostApiEvent, PostApiState> {
  PostRepository postRepository;
  PostApiBloc(this.postRepository) : super(PostApiState()) {
    on<PostFetched>(_fetchPost);
  }

  void _fetchPost(PostFetched event, Emitter<PostApiState> emit) async {
    emit(state.copyWith(postStatus: PostStatus.loading));
    await postRepository
        .getComments()
        .then((value) {
          emit(state.copyWith(postStatus: PostStatus.success, comments: value, message: "Comment fetched successfully"));
        })
        .onError((error, stackTrace) {
          emit(state.copyWith(postStatus: PostStatus.failed, message: error.toString()));
        });
  }
}
