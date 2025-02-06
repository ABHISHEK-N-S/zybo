import 'package:equatable/equatable.dart';
import 'package:zybo/data/model/banner_model.dart';
import 'package:zybo/data/model/product_model.dart';

enum Status { initial, success, failure }

class HomeState extends Equatable {
  final int? selectedIndex;
  final String error;
  final bool loading;
  final List<ProductListModel>? data;
  final List<BannerModel>? bannerdata;

  const HomeState({
    this.selectedIndex,
    this.error = "",
    this.loading = false,
    this.data,
    this.bannerdata,
  });

  @override
  List<Object> get props =>
      [selectedIndex ?? -1, error, loading, data ?? '', bannerdata ?? ""];

  HomeState copyWith({
    int? selectedIndex,
    String? error,
    bool? loading,
    List<ProductListModel>? data,
    final List<BannerModel>? bannerdata,
  }) {
    return HomeState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        error: error ?? this.error,
        loading: loading ?? this.loading,
        data: data ?? this.data,
        bannerdata: bannerdata ?? this.bannerdata);
  }
}
