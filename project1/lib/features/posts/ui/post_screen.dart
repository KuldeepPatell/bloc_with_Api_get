import 'package:flutter/material.dart';
import 'package:project1/features/posts/bloc/bloc/posts_bloc.dart';
// import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Postscreen extends StatefulWidget {
  const Postscreen({super.key});

  @override
  State<Postscreen> createState() => _PostscreenState();
}

class _PostscreenState extends State<Postscreen> {
  final PostsBloc postsBloc = PostsBloc();

  @override
  void initState() {
    postsBloc.add(PostsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          postsBloc.add(PostsAddEvent());
        },
      ),
      body: BlocConsumer<PostsBloc, PostsState>(
        bloc: postsBloc,
        listenWhen: (previous, current) => current is PostsActionState,
        buildWhen: (previous, current) => current is! PostsActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case PostsFetchingLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case PostsFetchingSuccessfulState:
              final successState = state as PostsFetchingSuccessfulState;
              return Container(
                child: ListView.builder(
                  itemCount: successState.posts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.grey.shade300,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(successState.posts[index].title)],
                      ),
                    );
                  },
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
