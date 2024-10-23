import 'package:bookly_app/features/favorite/presentation/views/widgets/custom_fav_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomFavAppBarWidget(
        isFavView: true,
        title: S.of(context).book_marks,
      ),
      body: Center(
        child: Text(S.of(context).book_marks),
      ),
    );
  }
}
