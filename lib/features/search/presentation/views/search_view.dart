import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';
import 'widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            List<ConnectivityResult> connectivityResults, Widget child) {
          final bool connected =
              connectivityResults[0] != ConnectivityResult.none;
          if (connected) {
            return const SearchViewBody();
          } else {
            return buildOfflineLottieWidget();
          }
        },
        child: Text(
          'Check your internet connection',
          style: Styles.textStyle18,
        ),
      ),
    );
  }

  Widget buildOfflineLottieWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/offline.json',
            repeat: true,
            animate: true,
            width: 200,
            height: 200,
          ),
          Text(
            S.of(context).check_your_internet,
            style: Styles.textStyle18,
          ),
          SizedBox(height: 20.h),
          //? Show retry button
          CustomButton(
            text: S.of(context).retry,
            onPressed: () {
              setState(() {});
            },
            bgColor: isDarkMode ? Colors.white : Colors.black,
            textColor: isDarkMode ? Colors.black : Colors.white,
          )
        ],
      ),
    );
  }
}
