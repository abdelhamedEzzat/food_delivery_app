import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/model/voucher.dart';

import '../../bloc/basket/basket_bloc.dart';

class VoucherScreen extends StatelessWidget {
  static const String routeName = "VoucherScreen";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const VoucherScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Voucher")),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50.h),
                      shape: const RoundedRectangleBorder(),
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  child: const Text("Apply"),
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter Voucher Code",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10.0, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Voucher Code",
                          contentPadding: EdgeInsets.all(10)),
                    ))
                  ],
                ),
              ),
              Text(
                "Your Vouchers ",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              ListView.builder(
                itemCount: Voucher.vouchers.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("1x",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer)),
                        SizedBox(
                          width: 20.w,
                        ),
                        Expanded(
                            child: Text(Voucher.vouchers[index].code,
                                style: Theme.of(context).textTheme.titleLarge)),
                        BlocBuilder<BasketBloc, BasketState>(
                          builder: (context, state) {
                            return TextButton(
                                onPressed: () {
                                  context
                                      .read<BasketBloc>()
                                      .add(AddVoucher(Voucher.vouchers[index]));
                                  Navigator.pop(context);
                                },
                                child: Text("Apply"));
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
