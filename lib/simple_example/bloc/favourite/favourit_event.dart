part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class FetchFavouriteList extends FavouriteEvent {}

class AddFavourite extends FavouriteEvent {
  final FavouriteModel item;
  const AddFavourite({required this.item});
}
// remove favourite

class RemoveFavourite extends FavouriteEvent {}

class UpdateCheck extends FavouriteEvent {
  final FavouriteModel item;
  const UpdateCheck({required this.item});
}
