import 'package:flutter/material.dart';
import 'package:hui/xunlianingpage.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/image.png'), // 修改为你自己的图片路径
            fit: BoxFit.cover, // 铺满整个屏幕
          ),
        ),
        child: Stack(
          children: [
            // 左上角文本
            const Padding(
              padding: EdgeInsets.only(left: 40, top: 110),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '开始训练',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // 中央斜体文本
            Align(
              alignment: Alignment.center,
              child: Transform.translate(
                offset: const Offset(0, -50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'ARE YOU',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'READY?',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 圆形按钮
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => XunlianingPage()),
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFF42DEE4),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFC6C6C6).withOpacity(0.8),
                          blurRadius: 0,
                          spreadRadius: 20,
                          offset: Offset(0, 0),
                        ),
                        BoxShadow(
                          color: const Color(0xFFDADADA).withOpacity(0.5),
                          blurRadius: 0,
                          spreadRadius: 40,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'GO!',
                        style: TextStyle(
                          fontSize: 35,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
