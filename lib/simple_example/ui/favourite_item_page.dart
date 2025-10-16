import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/favourite/favourite_bloc.dart';

class FavouriteItemPage extends StatefulWidget {
  const FavouriteItemPage({super.key});

  @override
  State<FavouriteItemPage> createState() => _FavouriteItemPageState();
}

class _FavouriteItemPageState extends State<FavouriteItemPage> {
  @override
  void initState() {
    context.read<FavouriteBloc>().add(FetchFavouriteList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favouriteBloc = BlocProvider.of<FavouriteBloc>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Favourite Item', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: () {
              favouriteBloc.add(RemoveFavourite());
            },
          ),
        ],
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          switch (state.apiState) {
            case ApiState.loading:
              return const Center(child: CircularProgressIndicator());
            case ApiState.loaded:
              if (favouriteBloc.favouriteItems.isNotEmpty) {
                return ListView.builder(
                  itemCount: favouriteBloc.favouriteItems.length,
                  itemBuilder: (context, index) {
                    final favouriteItem = favouriteBloc.favouriteItems[index];
                    return Card(
                      child: ListTile(
                        title: Text(
                          favouriteItem.name,
                          style: TextStyle(
                            color: Colors.black,
                            decoration: favouriteBloc.tempFavouriteItems.contains(favouriteItem) ? TextDecoration.lineThrough : TextDecoration.none,
                          ),
                        ),
                        leading: Checkbox(
                          value: favouriteBloc.tempFavouriteItems.contains(favouriteItem) ? true : false,
                          onChanged: (value) {
                            final favourite = FavouriteModel(
                              id: favouriteItem.id,
                              name: favouriteItem.name,
                              isFavourite: favouriteItem.isFavourite,
                              isCheck: !favouriteItem.isCheck,
                            );
                            favouriteBloc.add(UpdateCheck(item: favourite));
                          },
                        ),
                        trailing: AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          child: IconButton(
                            icon: Icon(
                              favouriteItem.isFavourite ? Icons.favorite : Icons.favorite_border,
                              color: favouriteItem.isFavourite ? Colors.red : Colors.grey,
                              size: favouriteItem.isFavourite ? 26 : 18,
                            ),
                            onPressed: () {
                              final favourite = FavouriteModel(
                                id: favouriteItem.id,
                                name: favouriteItem.name,
                                isFavourite: !favouriteItem.isFavourite,
                                isCheck: favouriteItem.isCheck,
                              );
                              favouriteBloc.add(AddFavourite(item: favourite));
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text('No Favourite Item'));
              }

            default:
              return const Center(child: Text('Something went wrong'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.black),
        onPressed: () {
          favouriteBloc.add(FetchFavouriteList());
        },
      ),
    );
  }
}
