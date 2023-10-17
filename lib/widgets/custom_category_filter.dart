import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/bloc/fillter/filter_bloc.dart';

class CustomCategryFilter extends StatelessWidget {
  const CustomCategryFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        if (state is FilterLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FilterLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.filter.categoryFilter.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.filter.categoryFilter[index].category.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(
                      height: 25.h,
                      child: Checkbox(
                        value: state.filter.categoryFilter[index].value,
                        onChanged: (bool? newValue) {
                          context.read<FilterBloc>().add(CategoryFillterUpdated(
                              categoryFilter: state.filter.categoryFilter[index]
                                  .copyWith(
                                      value: !state.filter.categoryFilter[index]
                                          .value)));
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          );
        } else {
          return const Text("Something Went Wrong");
        }
      },
    );
  }
}
