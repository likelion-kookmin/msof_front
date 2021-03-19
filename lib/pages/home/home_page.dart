import 'package:flutter/material.dart';
import 'package:msof_front/color.dart';
import 'package:msof_front/common/msof_scaffold.dart';
import 'package:msof_front/pages/home/widgets/carousel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MSOFScaffold(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.4,
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
                "멋쟁이 스택이 흘러넘쳐유~",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black87,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "질문하러가기",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Carousel(),
      ],
    );
  }
}
