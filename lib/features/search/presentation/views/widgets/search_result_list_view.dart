import '../../../../../core/widgets/custom_circular_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';

import '../../view_models/search_cubit/search_cubit.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          if (state.books.isNotEmpty) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 20.0,
              ),
              itemBuilder: (context, index) => BookItem(
                book: state.books[index],
              ),
            );
          } else {
            return const Center(
              child: Text("No Data"),
            );
          }
        } else if (state is SearchFailure) {
          return const Center(
            child: Text('No books found'),
          );
        } else {
          return const CustomCircularIndicator();
        }
      },
    );
  }
}
