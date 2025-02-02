part of 'blog_bloc.dart';

sealed class BlogState {}

final class BlogInitial extends BlogState {}

final class BlogLoading extends BlogState {}

final class BlogFailure extends BlogState {
  final String error;
  BlogFailure(this.error);
}

final class BlogUploadSuccess extends BlogState {}

final class BlogsDisplaySuccess extends BlogState {
  final List<BlogEntity> blogs;
  BlogsDisplaySuccess(this.blogs);
}
