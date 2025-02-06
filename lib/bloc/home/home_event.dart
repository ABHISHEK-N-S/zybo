part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SelectTab extends HomeEvent {
  final int index;
  const SelectTab(this.index);
}

final class GetProductsEvent extends HomeEvent {
  const GetProductsEvent();
}

final class GetBannerEvent extends HomeEvent {
  const GetBannerEvent();
}
