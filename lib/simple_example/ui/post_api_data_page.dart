import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post_api/post_api_bloc.dart';
import '../utils/enums.dart';

class PostApiDataPage extends StatefulWidget {
  const PostApiDataPage({super.key});

  @override
  State<PostApiDataPage> createState() => _PostApiDataPageState();
}

class _PostApiDataPageState extends State<PostApiDataPage> {
  @override
  void initState() {
    super.initState();
    context.read<PostApiBloc>().add((PostFetched()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<PostApiBloc, PostApiState>(
              builder: (context, state) {
                return state.postStatus == PostStatus.loading
                    ? Center(child: CircularProgressIndicator())
                    : state.postStatus == PostStatus.failed
                    ? Center(child: Text(state.message))
                    : ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: state.comments.length,
                        itemBuilder: (context, index) {
                          return ListTile(title: Text(state.comments[index].title!), subtitle: Text(state.comments[index].body!));
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
