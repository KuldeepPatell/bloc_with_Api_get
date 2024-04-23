part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

abstract class PostsActionState extends PostsState {}

final class PostsInitial extends PostsState {}

class PostsFetchingLoadingState extends PostsState {}

class PostsFetchingErrorState extends PostsState {}

class PostsFetchingSuccessfulState extends PostsState {
  final List<PostDataUiModel> posts;

  PostsFetchingSuccessfulState({required this.posts});
}

class PostAdditionSuccessState extends PostsActionState {}

class PostAdditionErrorState extends PostsActionState {}
