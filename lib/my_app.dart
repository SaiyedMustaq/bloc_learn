import 'package:bloc_app/simple_example/bloc/counter/counter_bloc.dart';
import 'package:bloc_app/simple_example/bloc/favourite/favourite_bloc.dart';
import 'package:bloc_app/simple_example/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_app/simple_example/bloc/post_api/post_api_bloc.dart';
import 'package:bloc_app/simple_example/bloc/switch/switch_bloc.dart';
import 'package:bloc_app/simple_example/bloc/todo/todo_bloc.dart';
import 'package:bloc_app/simple_example/repository/favourite_repository.dart';
import 'package:bloc_app/simple_example/repository/post_repository.dart';
import 'package:bloc_app/simple_example/ui/favourite_item_page.dart';
import 'package:bloc_app/simple_example/ui/image_picker_page.dart';
import 'package:bloc_app/simple_example/ui/post_api_data_page.dart';
import 'package:bloc_app/simple_example/ui/todo_example.dart';
import 'package:bloc_app/simple_example/utils/image_picker_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'equatable_testing.dart';
import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(imagePickerUtils: ImagePickerUtils())),
        BlocProvider(create: (context) => TodoBloc()),
        BlocProvider(create: (context) => FavouriteBloc(FavouriteRepository())),
        BlocProvider(create: (context) => PostApiBloc(PostRepository())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
        home: PostApiDataPage(),
      ),
    );
  }
}
