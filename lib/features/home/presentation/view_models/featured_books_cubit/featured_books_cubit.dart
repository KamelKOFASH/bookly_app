import 'package:bloc/bloc.dart';
import '../../../../../core/models/book_model/book_model.dart';
import '../../../data/repositories/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(FeaturedBooksError(failure.errMessage));
      },
      (books) {
        emit(FeaturedBooksLoaded(books));
      },
    );
  }
}
