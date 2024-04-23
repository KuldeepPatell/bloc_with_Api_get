import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project1/features/posts/models/post_data_ui_model.dart';
import 'package:project1/features/posts/repository/post_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    on<PostsAddEvent>(postsAddEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostsFetchingLoadingState());
    List<PostDataUiModel> posts = await PostRepository.fetchPosts();

    emit(PostsFetchingSuccessfulState(posts: posts));
  }

  FutureOr<void> postsAddEvent(
      PostsAddEvent event, Emitter<PostsState> emit) async {
    bool success = await PostRepository.addPost();
    print(success);
    if (success) {
      emit(PostAdditionSuccessState());
    } else {
      emit(PostAdditionErrorState());
    }
  }
}
