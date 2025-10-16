import '../bloc/favourite/favourite_bloc.dart';

class FavouriteRepository {
  //fetch list of favourite
  Future<List<FavouriteModel>> fetchFavouriteItems() async {
    //generate list using 2 sec delay
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(10, (index) => FavouriteModel(id: "${index + 1}", name: "Name ${index + 1}", isFavourite: false, isCheck: false));
  }
}
