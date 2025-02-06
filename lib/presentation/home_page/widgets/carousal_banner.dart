import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zybo/bloc/home/home_bloc.dart';
import 'package:zybo/bloc/home/home_state.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  _BannerCarouselState createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    context.read<HomeBloc>().add(const GetBannerEvent());

    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 150,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              // PageView to handle swiping between banners
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: state.bannerdata?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              state.bannerdata?[index].image ?? ""),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    );
                  },
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),

              //!  Show page indicator (dots) at the bottom
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  state.bannerdata?.length ?? 0,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
