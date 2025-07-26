import 'package:flutter/material.dart';
import 'package:hui/MainPage.dart';

import 'ShouYePage.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Align(
            alignment: Alignment.centerRight,
            widthFactor: 1, // 显示右边 50%，你可以调成 0.3、0.8 等
            child: Image.asset(
              "images/img.png",
              width: 600, // 图片本身宽度大于屏幕
              height: 450,
              fit: BoxFit.fitHeight,
            ),
          ),
          Text(
            "Science drives",
            style: TextStyle(
              color: Color(0xff1c2120),
              fontSize: 35,
              fontWeight: FontWeight.bold, // 加粗
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            // 可按需调整
            child: Text(
              "每一步康复，都是生命的勋章，您的康复之路将有我们陪伴",
              style: TextStyle(
                color: Color(0xff1c2120),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              textAlign: TextAlign.center, // 水平居中
            ),
          ),
          Container(
            width: double.infinity, // 按钮宽度填满屏幕
            padding: EdgeInsets.symmetric(horizontal: 16.0), // 外边距，可控制两边空隙
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF42DEE4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 13.0), // 内部上下 padding
              ),
              child: Text(
                "开始使用",
                style: TextStyle(
                  color: Color(0xff1c2120),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )


        ],
      ),
    );
  }
}
