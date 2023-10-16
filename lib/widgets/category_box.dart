import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/category_model.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    Key? key,
    required this.category,
  }) : super(key: key);
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(5.0)),
      child: Stack(children: [
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            child: category.image,
            height: 50.h,
            width: 60.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              category.name,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white),
            ),
          ),
        )
      ]),
    );
  }
}
