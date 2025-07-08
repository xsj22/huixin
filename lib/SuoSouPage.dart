import 'package:flutter/material.dart';
import 'package:hui/sspage.dart';

class SousuoPage extends StatelessWidget {
  const SousuoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c2120),
      appBar: AppBar(
        backgroundColor: Color(0xff1c2120),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '关注',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {},
              child: const Text(
                '发现',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 分类选项
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 分类标签部分
                Wrap(
                  spacing: 16, // 标签之间的间距
                  children: ['推荐', '科普', '饮食', '康复', '运动', '日常']
                      .map((category) => GestureDetector(
                    onTap: () {
                      // 点击事件
                    },
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ))
                      .toList(),
                ),

                // 向下图标
                const SizedBox(width: 8),
                const Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
          ),


          // 内容列表
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return _buildCard(
                  title: index % 2 == 0 ? '脑卒中预防饮食' : '脑卒中科普',
                  subtitle: index % 2 == 0 ? 'xx医生' : '国家卫生局',
                  imageUrl: 'images/img.png',
                  likes: index % 2 == 0 ? 1314 : 520,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // 卡片组件
  Widget _buildCard({
    required String title,
    required String subtitle,
    required String imageUrl,
    required int likes,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff272b2a),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 图片
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset('images/img.png', height: 150, fit: BoxFit.cover),
          ),

          // 标题和点赞
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.favorite_border, size: 16,color: Colors.white,),
                        const SizedBox(width: 4),
                        Text(
                          likes.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}