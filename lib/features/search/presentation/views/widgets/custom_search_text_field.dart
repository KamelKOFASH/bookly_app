import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/generated/l10n.dart';
import 'package:go_router/go_router.dart';

import '../../view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return TextField(
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          SearchCubit.get(context).searchBooks(query: value);
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          SearchCubit.get(context).searchBooks(query: value);
        }
      },
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: Icon(
          FontAwesomeIcons.magnifyingGlass,
          size: 20.h,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(
            FontAwesomeIcons.xmark,
            size: 20.sp,
          ),
        ),
        hintText: S.of(context).search,
        hintStyle: Styles.textStyle16.copyWith(color: Colors.grey.shade600),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
