import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../repository/favourite_repository.dart';

part 'favourit_event.dart';
part 'favourit_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteRepository favouriteRepository;
  List<FavouriteModel> favouriteItems = [];
  List<FavouriteModel> tempFavouriteItems = [];

  FavouriteBloc(this.favouriteRepository) : super(FavouriteState()) {
    on<FetchFavouriteList>(_fetchFavourite);
    on<AddFavourite>(_addFavourite);
    on<UpdateCheck>(_updateCheck);
    on<RemoveFavourite>(_removeAllFavourite);
  }

  void _fetchFavourite(FetchFavouriteList event, Emitter<FavouriteState> emit) async {
    favouriteItems = await favouriteRepository.fetchFavouriteItems();
    emit(state.copyWith(apiState: ApiState.loaded));
  }

  void _addFavourite(AddFavourite event, Emitter<FavouriteState> emit) {
    emit(state.copyWith(apiState: ApiState.initState));
    final index = favouriteItems.indexWhere((favourite) => favourite.id == event.item.id);

    if (event.item.isFavourite) {
      if (tempFavouriteItems.contains(favouriteItems[index])) {
        tempFavouriteItems.remove(favouriteItems[index]);
        tempFavouriteItems.add(event.item);
      }
    } else {
      if (tempFavouriteItems.contains(favouriteItems[index])) {
        tempFavouriteItems.remove(event.item);
        tempFavouriteItems.add(event.item);
      }
    }
    favouriteItems[index] = event.item;
    emit(state.copyWith(favouriteItems: List.from(favouriteItems), tempFavouriteItems: tempFavouriteItems, apiState: ApiState.loaded));
  }

  void _updateCheck(UpdateCheck event, Emitter<FavouriteState> emit) async {
    emit(state.copyWith(apiState: ApiState.initState));
    final index = favouriteItems.indexWhere((favourite) => favourite.id == event.item.id);
    if (index != -1) {
      favouriteItems[index] = event.item;
    }
    tempFavouriteItems.add(event.item);
    emit(state.copyWith(favouriteItems: favouriteItems, tempFavouriteItems: tempFavouriteItems, apiState: ApiState.loaded));
  }
  //remove all favourite

  void _removeAllFavourite(RemoveFavourite event, Emitter<FavouriteState> emit) {
    emit(state.copyWith(apiState: ApiState.initState));
    for (FavouriteModel item in tempFavouriteItems) {
      favouriteItems.remove(item);
    }
    tempFavouriteItems.clear();
    emit(state.copyWith(favouriteItems: List.from(favouriteItems), tempFavouriteItems: tempFavouriteItems, apiState: ApiState.loaded));
  }
}
