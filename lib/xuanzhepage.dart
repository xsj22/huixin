import 'package:flutter/material.dart';
import 'package:hui/stratpage.dart';

import 'CurvePainter.dart';

class Xuanzepage extends StatelessWidget {
  const Xuanzepage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> rehabOptions = [
      {'icon': Icons.pan_tool, 'title': '手部康复', 'color': Color(0xff67e6d1)},
      {'icon': Icons.record_voice_over, 'title': '语言康复', 'color': Color(0xffbaefc3)},
      {'icon': Icons.airline_seat_recline_normal, 'title': '坐位康复', 'color': Color(0xfffff3c8)},
      {'icon': Icons.favorite, 'title': '心理康复', 'color': Color(0xffbbe7ff)},
      {'icon': Icons.masks, 'title': '吞咽康复', 'color': Color(0xffccceff)},
      {'icon': Icons.more_horiz, 'title': '查看更多', 'color': Color(0xff1c2120)},
    ];
    List<Color> borderColors = [
      Color(0xffFFEBA4),
      Color(0xffADE3B6),
      Color(0xffFFEBA4),
      Color(0xffA5D8F4),
      Color(0xffC1C2F2),
      Colors.white,
    ];


    return Scaffold(
      backgroundColor: Color(0xfff7fafc),
      body: SafeArea(
        child: Column(
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
                        color: Color(0XFFe8edf5),
                        borderRadius: BorderRadius.circular(10), // 圆角大小
                      ),
                      child: const Icon(Icons.arrow_back, color: Color(0xff1c2120), size: 20),
                    ),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero, // 去除多余内边距
                    constraints: const BoxConstraints(), // 去除默认约束，避免图标溢出
                  ),
                  const Spacer(),
                  const Text(
                    '       选择',
                    style: TextStyle(color: Color(0xff1c2120), fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
            // 网格布局选项
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 25),
                child: GridView.builder(
                  itemCount: rehabOptions.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 3 / 3.7,
                  ),
                  itemBuilder: (context, index) {
                    final item = rehabOptions[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: item['color'],
                        border: Border.all(color: Colors.white, width: 0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          // 背景曲线绘制
                          Positioned.fill(
                            child: CustomPaint(
                              painter: CurvePainter(borderColors[index]),
                            ),
                          ),
                          // 图标
                          Positioned(
                            top: 20,
                            left: 20,
                            child: Icon(item['icon'], size: 30, color: Colors.black),
                          ),
                          // 标题 + 按钮
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: Row(
                              children: [
                                Text(
                                  item['title'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: index == rehabOptions.length - 1 ? Colors.white : Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 3),
                                IconButton(
                                  icon: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: borderColors[index],
                                        width: 2,
                                      ),
                                    ),
                                    child: Icon(Icons.add, color: index == rehabOptions.length - 1 ? Colors.white : Colors.black, size: 25),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => StartPage()),
                                    );
                                  },
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
