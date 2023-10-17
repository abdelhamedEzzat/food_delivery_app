import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/model/models.dart';
import 'package:food_delivery_app/model/voucher.dart';

import '../../model/basket_model.dart';
import '../../model/delivery_time_model.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketLoading()) {
    on<StartBasket>(_onStartBasket);
    on<AddItem>(_onAddItem);
    on<RemoveItem>(_onRemoveItem);
    on<ToggleSwitch>(_onToggleSwitch);
    on<RemoveAllItems>(_onRemoveALLItems);
    on<AddVoucher>(_onAddVoucher);
    on<SelectDliveryTime>(_onDliveryTime);
  }
  void _onStartBasket(
    StartBasket event,
    Emitter<BasketState> emit,
  ) async {
    emit(BasketLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(BasketLoaded(basket: Basket()));
    } catch (_) {}
  }

  void _onAddItem(
    AddItem event,
    Emitter<BasketState> emit,
  ) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(
          BasketLoaded(
            basket: state.basket.copyWith(
                items: List.from(state.basket.items)..add(event.item)),
          ),
        );
      } catch (_) {}
    }
  }

//  items: List.from(state.basket.items)..add(event.item),
  void _onRemoveItem(
    RemoveItem event,
    Emitter<BasketState> emit,
  ) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(
          BasketLoaded(
            basket: state.basket.copyWith(
              items: List.from(state.basket.items)..remove(event.item),
            ),
          ),
        );
      } catch (_) {}
    }
  }

  void _onToggleSwitch(
    ToggleSwitch event,
    Emitter<BasketState> emit,
  ) {
    final state = this.state;
    if (state is BasketLoaded) {
      emit(
        BasketLoaded(
          basket: state.basket.copyWith(cutlery: !state.basket.cutlery),
        ),
      );
    }
  }

  void _onRemoveALLItems(RemoveAllItems event, Emitter<BasketState> emit) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(
          BasketLoaded(
            basket: state.basket.copyWith(
              items: List.from(state.basket.items)
                ..removeWhere((item) => item == event.item),
            ),
          ),
        );
      } catch (_) {}
    }
  }

  void _onAddVoucher(AddVoucher event, Emitter<BasketState> emit) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(
          BasketLoaded(basket: state.basket.copyWith(voucher: event.voucher)),
        );
      } catch (_) {}
    }
  }

  void _onDliveryTime(SelectDliveryTime event, Emitter<BasketState> emit) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(
          BasketLoaded(
              basket: state.basket.copyWith(deliveryTime: event.deliveryTime)),
        );
      } catch (_) {}
    }
  }
}
