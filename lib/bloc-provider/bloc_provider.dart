// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:zybo/bloc/home/home_bloc.dart';
import 'package:zybo/bloc/otp/otp_bloc.dart';
import 'package:zybo/bloc/splash/splash_bloc.dart';
import 'package:zybo/data/datasource/otp_datasource.dart';
import 'package:zybo/data/datasource/products_datasource.dart';
import 'package:zybo/data/repository/otp_repo.dart';
import 'package:zybo/data/repository/product_repo.dart';

List<SingleChildWidget> blocProviderList = [
  //!---------(Home bloc)
  BlocProvider(
    create: (context) =>
        HomeBloc(ProductsRepository(dataSource: ProductsDatasource())),
  ),
  BlocProvider(
    create: (context) => OtpBloc(OTPRepository(dataSource: OtpDatasource())),
  ),

  // splash bloc
  BlocProvider(
    create: (context) => SplashBloc()
      ..add(
        SplashInit(),
      ),
  ),
];
