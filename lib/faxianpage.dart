import 'package:flutter/material.dart';
import 'package:hui/ChatDetailPage.dart';

class FaxianPage extends StatelessWidget {
  const FaxianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7fafc),
      appBar: AppBar(
        backgroundColor: Color(0xfff7fafc),
        title: const Text(
          '消息',
          style: TextStyle(color: Color(0xff1c2120)),
        ),
        centerTitle: true, // 设置标题居中
        automaticallyImplyLeading: false, // 去掉返回箭头
        actions: [
          PopupMenuButton<String>(
            color: const Color(0XFFe8edf5), // 设置菜单背景颜色
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // 设置圆角
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Icon(Icons.people_outline, color: Color(0xff1c2120)),
                  const Text(
                    '发现群聊',
                    style: TextStyle(color: Color(0xff1c2120), fontSize: 16),
                  ),
                ],
              ),
            ),
            onSelected: (value) {
              // 处理菜单项点击事件
              if (value == '创建群聊') {
                // 逻辑代码
              } else if (value == '群聊广场') {
                // 逻辑代码
              } else if (value == '附近的群') {
                // 逻辑代码
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: '创建群聊',
                child: ListTile(
                  leading: Icon(Icons.add, color: Color(0xff1c2120)),
                  title: Text('创建群聊',style: TextStyle(color: Color(0xff1c2120)),),
                ),
              ),
              const PopupMenuItem(
                value: '群聊广场',
                child: ListTile(
                  leading: Icon(Icons.group, color: Color(0xff1c2120)),
                  title: Text('群聊广场',style: TextStyle(color: Color(0xff1c2120)),),
                ),
              ),
              const PopupMenuItem(
                value: '附近的群',
                child: ListTile(
                  leading: Icon(Icons.near_me, color: Color(0xff1c2120)),
                  title: Text('附近的群',style: TextStyle(color: Color(0xff1c2120)),),
                ),
              ),
            ],
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          // 功能按钮区域
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFeatureButton(Icons.favorite, '赞和收藏', Color(0xFFfee4e4), Color(0xFFff5a58)),
                _buildFeatureButton(Icons.school, '新增关注', Color(0xFFe4f2ff), Color(0xFF2f8aff)),
                _buildFeatureButton(Icons.spa, '评论和@', Color(0xFFe2fbf1), Color(0xFF1ce295)),
              ],
            )
          ),
          SizedBox(height: 30,),
          // 消息列表
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildMessageTile(
                  context: context,
                  title: '快乐交友会',
                  subtitle: '小水: 大家下午好啊',
                  time: '昨天',
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // 功能按钮组件
  Widget _buildFeatureButton(IconData icon, String label, Color bgColor, Color iconColor) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12), // 正方形圆角背景
          ),
          child: Icon(icon, color: iconColor, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Color(0xff1c2120),fontWeight: FontWeight.bold),
        ),
      ],
    );
  }


  // 消息列表组件
  Widget _buildMessageTile({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        // tileColor: const Color(0xFF272B2A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.grey.shade300,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xff1c2120),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 13, color: Color(0xff1c2120)),
        ),
        trailing: Text(
          time,
          style: const TextStyle(fontSize: 12, color: Color(0xff1c2120)),
        ),
        onTap: () {
          // 跳转到聊天详情页性收费电视v但是vvvfdh
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatDetailPage(title: '快乐交友会',),
            ),
          );
        },
      ),
    );
  }
}