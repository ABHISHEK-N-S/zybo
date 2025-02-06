import 'package:zybo/data/datasource/otp_datasource.dart';
import 'package:zybo/data/datasource/products_datasource.dart';
import 'package:zybo/data/repository/otp_repo.dart';
import 'package:zybo/data/repository/product_repo.dart';
import 'package:zybo/data/service/otp_service.dart';
import 'package:zybo/data/service/product_service.dart';
import 'package:zybo/main.dart';

void autoInjectInitializer() => autoInjector
  //*------home
  ..add(ProductsDatasource.new)
  ..add(ProductsRepository.new)
  ..add(ProductService.new)

  //*------mobile
  ..add(OtpDatasource.new)
  ..add(OTPRepository.new)
  ..add(OtpService.new)

  //!-----( need to initialize before commiting)
  ..commit();
