import 'package:flutter/material.dart';
import 'package:hui/xuanzhepage.dart';
import 'StrokeRecoveryPainter.dart';

class ShouyePage extends StatelessWidget {
  const ShouyePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c2120),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),

              // 顶部头像与问候语
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("images/img.png"), // 替换为你的头像路径
                      radius: 30,
                    ),
                    const SizedBox(width: 15),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "早上好!!",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "花开富贵",
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.notifications_none, color: Colors.white),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 热门康复训练标题
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text(
                  "热门康复训练计划",
                  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),

              // 康复训练卡片 - 可左右滑动
              SizedBox(
                height: 360,
                child: PageView(
                  controller: PageController(viewportFraction: 0.80),
                  children: [
                    _buildTrainingCard(
                      "中风恢复训练",
                      "images/img.png",
                      const Color(0xff42dee4),
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Xuanzepage()),
                        );
                      },
                    ),
                    _buildTrainingCard(
                      "中风每日训练" + "\n"
                          "Workout",
                      "images/img.png",
                      const Color(0xfffff6e9),
                          () {
                        // 另一个跳转逻辑
                      },
                    ),
                  ],
                ),
              ),


              const SizedBox(height: 20),

              // 今日康复训练标题
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "今天的康复训练",
                  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),

              const SizedBox(height: 10),

              // 今日训练卡片
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "images/img.png", // 替换为你的图片路径
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "患侧卧位",
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "24 天挑战",
                              style: TextStyle(color: Colors.white70, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTrainingCard(String title, String imagePath, Color bgColor, VoidCallback onPressed) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
    decoration: BoxDecoration(
      color: bgColor, // 使用传入的颜色
      borderRadius: BorderRadius.circular(20),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          CustomPaint(
            size: const Size(double.infinity, double.infinity),
            painter: StrokeRecoveryPainter(),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 3),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  ),
                  child: const Text(
                    " 开始 ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

