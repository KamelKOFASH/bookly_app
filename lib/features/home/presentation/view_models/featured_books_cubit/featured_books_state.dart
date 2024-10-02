part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksCubitInitial extends FeaturedBooksState {}

final class FeaturedBooksCubitLoading extends FeaturedBooksState {}

final class FeaturedBooksCubitLoaded extends FeaturedBooksState {
  final List<BookModel> books;
  const FeaturedBooksCubitLoaded({required this.books});
}

final class FeaturedBooksCubitError extends FeaturedBooksState {
  final String message;
  const FeaturedBooksCubitError({required this.message});
}
