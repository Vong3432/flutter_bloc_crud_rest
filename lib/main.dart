import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_crud/bloc/posts/lists/posts_bloc.dart';
import 'package:post_crud/bloc/posts/post/post_bloc.dart';
import 'package:post_crud/ui/posts/post_listing_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostsBloc>(
          create: (context) => PostsBloc(),
        ),
        BlocProvider<PostBloc>(
          create: (context) => PostBloc(),
        ),
      ],
      child: const CupertinoApp(
        title: 'Postzie',
        home: PostListingView(),
      ),
    );
  }
}
