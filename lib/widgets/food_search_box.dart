import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodSearchBox extends StatelessWidget {
  const FoodSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "What Would You Like To eat ?",
                  suffixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 20, bottom: 5, right: 5),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white))),
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
            width: 40.w,
            height: 40.h,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("FilterScreen");
                },
                color: Theme.of(context).colorScheme.primary,
                icon: const Icon(Icons.menu)),
          )
        ],
      ),
    );
  }
}
