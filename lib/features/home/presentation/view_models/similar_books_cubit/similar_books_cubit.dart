import 'package:bloc/bloc.dart';
import '../../../data/models/book_model/book_model.dart';
import '../../../data/repositories/home_repo_impl.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepoImpl homeRepo ;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    final result = await homeRepo.fetchSimilarBooks(category);
    result.fold(
      (failure) => emit(SimilarBooksFailure(failure.errMessage)),
      (books) => emit(SimilarBooksSuccess(books)),
    );
  }
}
