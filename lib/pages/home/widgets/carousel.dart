import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:msof_front/color.dart';
import 'package:msof_front/common/responsive_container.dart';

final images = [
  'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
  'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
  'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
  'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
  'https://images.unsplash.com/photo-1593642634402-b0eb5e2eebc9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
  'https://images.unsplash.com/photo-1616081531498-4d36dc59644f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
  'https://images.unsplash.com/photo-1614862876404-6866712b4a17?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
  'https://images.unsplash.com/photo-1615999452307-8babf494d226?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
  'https://images.unsplash.com/photo-1615999452307-8babf494d226?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
  'https://images.unsplash.com/photo-1615999452307-8babf494d226?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
  'https://images.unsplash.com/photo-1615999452307-8babf494d226?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
  'https://images.unsplash.com/photo-1615999452307-8babf494d226?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
  'https://images.unsplash.com/photo-1615999452307-8babf494d226?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
  'https://images.unsplash.com/photo-1615999452307-8babf494d226?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
  'https://images.unsplash.com/photo-1615999452307-8babf494d226?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
  'https://images.unsplash.com/photo-1615999452307-8babf494d226?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
  'https://images.unsplash.com/photo-1615999452307-8babf494d226?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
  'https://images.unsplash.com/photo-1615999452307-8babf494d226?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
  'https://images.unsplash.com/photo-1615999452307-8babf494d226?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
  'https://images.unsplash.com/photo-1615999452307-8babf494d226?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
];

class Carousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CarouselState();
  }
}

class CarouselState extends State<Carousel> {
  final controller = CarouselController();

  int currentIndex = 0;
  final isHovered = List.generate(images.length, (index) => false);
  final List<String> labels = List.generate(images.length, (index) {
    return '대충 공지사항 $index';
  });

  @override
  void initState() {
    // 이미지를 미리 다운받아서 캐싱해두는 작업
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  Widget _buildCarousel() {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Stack(children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            // 슬라이드에 나오는 컨테이너의 모양을 잡음
            return ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            );
          },
          options: CarouselOptions(
            scrollPhysics: ResponsiveContainer.isSmallScreen(context)
                ? PageScrollPhysics()
                : NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
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
        AspectRatio(
          aspectRatio: 18 / 8,
          child: Center(
            child: Text(
              labels[currentIndex],
              style: TextStyle(
                letterSpacing: 8,
                fontSize: size.width / 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildCarouselController() {
    final size = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(maxHeight: size.height * 0.5),
      child: Scrollbar(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onHover: (value) {
                    setState(() {
                      isHovered[index] = value;
                    });
                  },
                  onTap: () {
                    controller.animateToPage(index);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: size.height / 80,
                      bottom: size.height / 90,
                    ),
                    child: Text(
                      labels[index],
                      style: TextStyle(
                        color: isHovered[index]
                            ? Theme.of(context)
                                .primaryTextTheme
                                .button!
                                .decorationColor
                            : Theme.of(context).primaryTextTheme.button!.color,
                      ),
                    ),
                  ),
                ),
                SelectedItemUnderline(
                  selected: currentIndex == index,
                  width: size.width / 10,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
      child: Row(
        children: [
          Expanded(flex: 6, child: _buildCarousel()),
          ResponsiveContainer.isSmallScreen(context)
              ? Container()
              : Expanded(flex: 1, child: _buildCarouselController()),
        ],
      ),
    );
  }
}

class SelectedItemUnderline extends StatelessWidget {
  final bool selected;
  final double width;

  const SelectedItemUnderline({
    Key? key,
    required this.selected,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: selected,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 400),
        opacity: selected ? 1 : 0,
        child: Container(
          height: 5,
          decoration: BoxDecoration(
            color: likelionOrange,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          width: width,
        ),
      ),
    );
  }
}
