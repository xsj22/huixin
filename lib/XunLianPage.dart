import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'MainPage.dart';

class XunLianPage extends StatelessWidget {
  const XunLianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c2120),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 标题
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
                    '         报告',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),

            // 时间筛选按钮
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['每天', '每周', '每月', '每年'].map((filter) {
                  bool isSelected = filter == '每周'; // 设置选中项
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xff42dee4)
                          : const Color(0xff2a2f2e),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      filter,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : Colors.white.withOpacity(0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 24),

            Container(
                margin: const EdgeInsets.all(16), // 外边距
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xff2a2f2e),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SfCartesianChart(
                    backgroundColor: const Color(0xff2a2f2e),
                    plotAreaBorderWidth: 0, // ✅ 移除 plot 区边框线
                    plotAreaBackgroundColor: Colors.transparent,
                    primaryXAxis: CategoryAxis(
                      labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      axisLine: const AxisLine(color: Colors.transparent),
                      majorTickLines: const MajorTickLines(size: 0),
                    ),
                    primaryYAxis: NumericAxis(
                      minimum: 0,
                      maximum: 20,
                      interval: 5,
                      labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      axisLine: const AxisLine(color: Colors.transparent),
                      majorGridLines: MajorGridLines(
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                    series: <ChartSeries>[
                      ColumnSeries<_ChartData, String>(
                          dataSource: [
                            _ChartData('一', 10),
                            _ChartData('二', 18),
                            _ChartData('三', 15),
                            _ChartData('四', 18),
                            _ChartData('五', 7),
                            _ChartData('六', 4),
                            _ChartData('七', 10),
                          ],
                          xValueMapper: (data, _) => data.x,
                          yValueMapper: (data, _) => data.y,
                          color: const Color(0xff42dee4),
                          spacing: 0,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20), // 仅顶部左圆角
                            topRight: Radius.circular(20), // 仅顶部右圆角
                          )),
                    ],
                    annotations: <CartesianChartAnnotation>[
                      // 添加虚线标记线
                      CartesianChartAnnotation(
                        widget: Container(
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 6),
                                decoration: BoxDecoration(
                                  color: const Color(0xff42dee4),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  '10',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                            ],
                          ),
                        ),
                        coordinateUnit: CoordinateUnit.point,
                        region: AnnotationRegion.chart,
                        x: '一',
                        y: 10,
                      ),
                    ])),

            const SizedBox(height: 24),

            // 历史记录标题
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                '历史',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 12),

            // 历史记录卡片
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildHistoryItem('星期二', '21', '10', '1hr 10m'),
                  _buildHistoryItem('星期一', '20', '12', '0hr 58m'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 历史记录卡片组件
  Widget _buildHistoryItem(String day, String date, String count, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xff2a2f2e),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 日期和星期
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                day,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // 垂直分割线
          Container(
            width: 1,
            height: 40,
            color: Colors.white.withOpacity(0.3),
          ),
          // 训练次数
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '训练次数',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                count,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // 时间
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '时间',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 图表数据类
class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
