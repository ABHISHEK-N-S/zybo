import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:zybo/data/model/banner_model.dart';
import 'package:zybo/data/model/product_model.dart';
import 'package:zybo/data/service/product_service.dart';
import 'package:zybo/error/exceptions.dart';
import 'package:zybo/main.dart';

class ProductsDatasource {
  ProductsDatasource();
  final ProductService service = autoInjector.get<ProductService>();
  Future<List<ProductListModel>> getProductListApi() async {
    try {
      final Response? response = await service.getProductListApi();

      final List<ProductListModel> model = (response?.data as List<dynamic>)
          .map(
              (json) => ProductListModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return model;
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  //!----------------------banner
  Future<List<BannerModel>> getBannersApi() async {
    try {
      final Response? response = await service.getBannerApi();
      log(response!.data.toString(), name: "sayGSUKAhs");
      final List<BannerModel> model = (response.data as List<dynamic>)
          .map((json) => BannerModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return model;
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }
}
