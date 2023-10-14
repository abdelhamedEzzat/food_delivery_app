import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/bloc/auto_complete_bloc/auto_complete_bloc.dart';

class LocationSearchBox extends StatelessWidget {
  const LocationSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutoCompleteBloc, AutoCompleteState>(
      builder: (context, state) {
        if (state is AutoCompleteLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AutoCompleteLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter Your Location",
                  suffixIcon: const Icon(Icons.search),
                  contentPadding:
                      const EdgeInsets.only(left: 20, bottom: 5, right: 5),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white))),
              onChanged: (value) {
                context
                    .read<AutoCompleteBloc>()
                    .add(LoadAutoComplete(searchInput: value));
              },
            ),
          );
        } else {
          return const Text("Error");
        }
      },
    );
  }
}
