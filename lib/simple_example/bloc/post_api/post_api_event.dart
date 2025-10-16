part of 'post_api_bloc.dart';

@immutable
abstract class PostApiEvent extends Equatable {
  const PostApiEvent();
  @override
  List<Object?> get props => [];
}

final class PostFetched extends PostApiEvent {}
