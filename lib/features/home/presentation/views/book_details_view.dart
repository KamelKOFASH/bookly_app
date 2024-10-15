import '../../../../core/models/book_model/book_model.dart';
import '../view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.book});
  final BookModel book;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
      category: widget.book.volumeInfo?.categories?[0] ?? 'Programming',
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BookDetailsViewBody(book: widget.book,),
    );
  }
}
