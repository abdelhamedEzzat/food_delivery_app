import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/model/category_model.dart';

class CustomCategryFilter extends StatelessWidget {
  final List<Category> categories;
  const CustomCategryFilter({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categories[index].name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 25.h,
                child: Checkbox(
                  value: false,
                  onChanged: (bool? newValue) {},
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
