import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zybo/bloc/home/home_state.dart';
import 'package:zybo/data/model/banner_model.dart';
import 'package:zybo/data/model/product_model.dart';
import 'package:zybo/data/repository/product_repo.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductsRepository _repository;

  HomeBloc(this._repository) : super(const HomeState()) {
    on<GetProductsEvent>(_getProductsList);
    on<GetBannerEvent>(_getBannersList);

    on<SelectTab>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });
  }

  FutureOr<void> _getProductsList(
      GetProductsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: true));

    try {
      List<ProductListModel> response = await _repository.getProductListApi();

      if (response.isNotEmpty) {
        emit(state.copyWith(loading: false, data: response));
      } else {
        emit(state.copyWith(loading: false, error: 'No data found'));
      }
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  FutureOr<void> _getBannersList(
      GetBannerEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: true));

    try {
      List<BannerModel> response = await _repository.getBannerApi();

      if (response.isNotEmpty) {
        emit(state.copyWith(loading: false, bannerdata: response));
      } else {
        emit(state.copyWith(loading: false, error: 'No data found'));
      }
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}
