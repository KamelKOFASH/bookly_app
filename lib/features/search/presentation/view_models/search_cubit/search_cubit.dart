import '../../../data/repositories/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/book_model/book_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> searchBooks({required String query}) async {
    emit(SearchLoading());
    var result = await searchRepo.searchBooks(query: query);
    result.fold(
      (failure) {
        emit(SearchFailure(errMessage: failure.errMessage));
      },
      (books) {
        emit(SearchSuccess(books: books));
      },
    );
  }
}
