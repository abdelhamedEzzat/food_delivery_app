// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'basket_bloc.dart';

sealed class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class StartBasket extends BasketEvent {
  @override
  List<Object> get props => [];
}

class AddItem extends BasketEvent {
  final MenuItem item;

  const AddItem(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveItem extends BasketEvent {
  final MenuItem item;

  const RemoveItem(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveAllItems extends BasketEvent {
  final MenuItem item;

  const RemoveAllItems(this.item);

  @override
  List<Object> get props => [item];
}

class ToggleSwitch extends BasketEvent {
  const ToggleSwitch();

  @override
  List<Object> get props => [];
}

class AddVoucher extends BasketEvent {
  final Voucher voucher;
  const AddVoucher(
    this.voucher,
  );

  @override
  List<Object> get props => [];
}

class SelectDliveryTime extends BasketEvent {
  final DeliveryTime deliveryTime;
  const SelectDliveryTime(
    this.deliveryTime,
  );

  @override
  List<Object> get props => [deliveryTime];
}
