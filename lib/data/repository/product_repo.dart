import 'package:logger/logger.dart';
import 'package:zybo/data/datasource/products_datasource.dart';
import 'package:zybo/data/model/banner_model.dart';
import 'package:zybo/data/model/product_model.dart';
import 'package:zybo/error/exceptions.dart';
import 'package:zybo/helper/logger.dart';

class ProductsRepository {
  final ProductsDatasource _dataSource;

  ProductsRepository({
    required ProductsDatasource dataSource,
  }) : _dataSource = dataSource;
  Future<List<ProductListModel>>  getProductListApi() async {
    try {
      final List<ProductListModel> response = await _dataSource.getProductListApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
  //!----------------------repo
   Future<List<BannerModel>>  getBannerApi() async {
    try {
      final List<BannerModel> response = await _dataSource.getBannersApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
