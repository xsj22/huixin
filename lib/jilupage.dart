import 'package:flutter/material.dart';
import 'package:hui/MainPage.dart';
import 'package:hui/XunLianPage.dart';

class JiliPage extends StatelessWidget {
  const JiliPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff1c2120),
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 顶部返回按钮与标题
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.arrow_back,
                              color: Colors.black, size: 20),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                                (route) => false, // 所有旧页面都移除
                          );
                        },
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const Spacer(),
                      const Text(
                        '         记录',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                ),

                // 日期选择器
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(7, (index) {
                      bool isSelected = index == 2; // 当前选中日期
                      return Column(
                        children: [
                          Text(
                            ['一', '二', '三', '四', '五', '六', '日'][index],
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7), fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xff42dee4)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                              child: Text(
                                (19 + index).toString(),
                                style: TextStyle(
                                    color: isSelected
                                        ? Colors.black
                                        : Colors.white.withOpacity(0.7),
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),

                // 今日报告
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '今日报告',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: const Color(0xff2a2f2e),
                            borderRadius: BorderRadius.circular(16)),
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 2, // 卡片的宽高比
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            _buildReportItem('训练时间', '32分钟', Icons.local_fire_department,context),
                            _buildReportItem('姿势正确率', '98%', Icons.flash_on,context),
                            _buildReportItem('心情', '良好', Icons.nature,context),
                            _buildReportItem('经验', '+3', Icons.emoji_events,context),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                // 今日计划
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 20, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '今日计划',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          '显示全部',
                          style: TextStyle(
                              color: Color(0xff00d8a4),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),

                // 活动列表
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _buildActivityItem('握手翻身训练', '3组向偏瘫翻身', '06:00 AM'),
                      _buildActivityItem('桥试训练', '3组抬臀', '08:45 AM'),
                    ],
                  ),
                ),
              ],
            )));
  }

  Widget _buildReportItem(String title, String value, IconData icon, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const XunLianPage()), // 替换为你要跳转的页面
        );
      },
      borderRadius: BorderRadius.circular(16), // 点击时的波纹圆角
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff2a2f2e),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xff42dee4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: const Color(0xff262f2d), size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(color: Colors.white70, fontSize: 11),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(String title, String subtitle, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color(0xff2a2f2e),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                  image: NetworkImage(
                      'https://via.placeholder.com/150'), // 替换为实际图片
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.normal)),
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(
                color: Colors.white70, fontSize: 14, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}