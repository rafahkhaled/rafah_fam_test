import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rafah_fam_test/core/app_export.dart';

import '../../home_page/bloc/swiper_bloc/swiper_bloc.dart';
import '../model/property_model.dart';

class Imagesliderwidget extends StatelessWidget {
  final List<Images> images;
  Imagesliderwidget({required this.images});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwiperBloc(),
      child: Imageslider(
        images: images,
      ),
    );
  }
}

// ignore: must_be_immutable
class Imageslider extends StatelessWidget {
  final List<Images> images;
  Imageslider({required this.images});

  @override
  Widget build(BuildContext context) {
    final SwiperBloc swiperBloc = BlocProvider.of<SwiperBloc>(context);
    List<Widget> imageSliders = images.map((url) {
      return CustomImageView(
        imagePath: url.imageUrl,
        fit: BoxFit.cover,
      );
    }).toList();
    return BlocBuilder<SwiperBloc, int>(
      bloc: swiperBloc,
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CarouselSlider(
                items: imageSliders.isEmpty
                    ? [
                        Image.asset(
                          ImageConstant.imagenotfound,
                          fit: BoxFit.cover,
                        )
                      ]
                    : imageSliders,
                carouselController: swiperBloc.carouselController,
                options: CarouselOptions(
                  reverse: true,
                  height: 250,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    swiperBloc.add(SwiperEvent.updateindex);
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageSliders.asMap().entries.map((entry) {
                return Container(
                  width: state == entry.key ? 12.0 : 8.0,
                  height: state == entry.key ? 12.0 : 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                );
              }).toList(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  swiperBloc.add(SwiperEvent.pageChanged);
                },
                child: Container(
                  height: 25,
                  width: 25,
                  margin: EdgeInsets.only(right: 12.0),
                  decoration: AppDecoration.fillWhiteA.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder28,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: appTheme.gray10001,
                      size: 14,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

// // Your list of widgets for the carousel for
// List<Widget> imageSliders = [
//   Container(
//     width: double.infinity,
//     child: Image.asset(
//       ImageConstant.imgShape14,
//       fit: BoxFit.cover,
//     ),
//   ),
//   Container(
//     width: double.infinity,
//     child: Image.asset(
//       ImageConstant.imgShape12,
//       fit: BoxFit.cover,
//     ),
//   ),
//   Container(
//     width: double.infinity,
//     child: Image.asset(
//       ImageConstant.imgShape13,
//       fit: BoxFit.cover,
//     ),
//   )
// ];
