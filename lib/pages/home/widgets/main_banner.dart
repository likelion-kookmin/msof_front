import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:msof_front/color.dart';
import 'package:msof_front/common/mouse_hover.dart';
import 'package:msof_front/utils/screen_size_util.dart';

class MainBanner extends StatefulWidget {
  @override
  _MainBannerState createState() => _MainBannerState();
}

class _MainBannerState extends State<MainBanner> {
  final controller = CarouselController();

  int currentIndex = 0;

  final items = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider.builder(
            itemCount: items.length,
            itemBuilder: (context, index, realIndex) {
              // 슬라이드에 나오는 컨테이너의 모양을 잡음
              return Container(
                width: width,
                height: height * 0.4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: likelionOrange,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '멋쟁이 스택이 흘러넘쳐유~',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: backgroundColor,
                        onPrimary: textColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        '질문하러가기',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              scrollPhysics: ScreenSizeUtil.onlyTouch(context)
                  ? PageScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              enlargeCenterPage: true,
              aspectRatio: 18 / 8,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            carouselController: controller,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              items.length,
              (index) {
                return MouseHover(
                  child: GestureDetector(
                    onTap: () => controller.animateToPage(index),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == index
                            ? Color.fromRGBO(0, 0, 0, 0.9)
                            : Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: width,
            height: height * 0.4,
            alignment: Alignment.center,
            child: AspectRatio(
              aspectRatio: 18 / 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MouseHover(
                    child: GestureDetector(
                      onTap: () => controller.previousPage(),
                      child: Icon(
                        Icons.chevron_left,
                        color: sideColor,
                        size: 60,
                      ),
                    ),
                  ),
                  MouseHover(
                    child: GestureDetector(
                      onTap: () => controller.nextPage(),
                      child: Icon(
                        Icons.chevron_right,
                        color: sideColor,
                        size: 60,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
