import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:zybo/bloc/home/home_bloc.dart';
import 'package:zybo/bloc/home/home_state.dart';
import 'package:zybo/global_widgets/custom_textfield.dart';
import 'package:zybo/style/app_colors.dart';
import 'package:zybo/global_widgets/bottom_nav.dart';

import 'widgets/carousal_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _currentIndex = 0;
  // final List<String> bannerImages = [
  //   'assets/banner1.jpg',
  //   'assets/banner2.jpg',
  //   'assets/banner3.jpg',
  // ];

  @override
  void initState() {
    context.read<HomeBloc>().add(const GetProductsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [const Gap(30),
                  const CustomSearchTextField()
                  // Container(
                  //   decoration: const BoxDecoration(
                  //     color: AppColors.white,
                  //     boxShadow: [
                  //       BoxShadow(
                  //         // shadow color
                  //         spreadRadius: 2,
                  //         blurRadius: 5,
                  //         offset: Offset(0, 3),
                  //       ),
                  //     ],
                  //   ),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       hintText: 'Search',
                  //       prefixIcon: const Icon(Icons.search),
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  , BannerCarousel(),
                  const SizedBox(height: 10),
                  const Text('Popular Product',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: state.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      log((state.data?.length ?? 0).toString(), name: "asahdh");
                      return Stack(
                        children: [
                          Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                state.data?[index]
                                                        .featuredImage ??
                                                    "",
                                              ),
                                              fit: BoxFit.fill)),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          (state.data?[index].salePrice ?? 0)
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          (state.data?[index].salePrice ?? 0)
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                        const Gap(10),
                                        const Icon(Icons.star,
                                            color: Colors.amber, size: 16),
                                        const Text("4.5"),
                                      ],
                                    ),
                                    Text(state.data?[index].name ?? "",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 16,
                            right: 16,
                            child: IconButton(
                              icon: const Icon(Icons.favorite_border),
                              color: Colors.grey,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}
