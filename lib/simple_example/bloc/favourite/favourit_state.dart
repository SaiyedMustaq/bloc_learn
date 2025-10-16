part of 'favourite_bloc.dart';

enum ApiState { initState, loading, loaded, error }

class FavouriteState extends Equatable {
  final List<FavouriteModel> favouriteItems;
  final List<FavouriteModel> tempFavouriteItems;
  final ApiState apiState;
  const FavouriteState({this.tempFavouriteItems = const [], this.favouriteItems = const [], this.apiState = ApiState.loading});

  //copy with
  FavouriteState copyWith({List<FavouriteModel>? favouriteItems, List<FavouriteModel>? tempFavouriteItems, ApiState? apiState}) {
    return FavouriteState(
      tempFavouriteItems: tempFavouriteItems ?? this.tempFavouriteItems,
      favouriteItems: favouriteItems ?? this.favouriteItems,
      apiState: apiState ?? this.apiState,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [favouriteItems, tempFavouriteItems, apiState];
}

class FavouriteModel extends Equatable {
  final String id;
  final String name;
  final bool isFavourite;
  final bool isCheck;

  const FavouriteModel({required this.id, required this.name, required this.isFavourite, required this.isCheck});
  //copy with method

  FavouriteModel copyWith({String? id, String? name, bool? isFavourite, bool? isCheck}) {
    return FavouriteModel(id: id ?? this.id, name: name ?? this.name, isFavourite: isFavourite ?? this.isFavourite, isCheck: isCheck ?? this.isCheck);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'isFavourite': isFavourite, 'isCheck': isCheck};
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, isFavourite, isCheck];
}
