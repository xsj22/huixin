import 'package:flutter/material.dart';

class SsPage extends StatelessWidget {
  const SsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7fafc),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Color(0xfff7fafc),
          elevation: 0,
          iconTheme: const IconThemeData(color: Color(0xff1c2120)), // 设置返回按钮为白色
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Color(0XFFe8edf5),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Color(0xff1c2120)),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '脑卒中康复训练',
                      hintStyle: TextStyle(color: Color(0xff1c2120)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Icon(Icons.camera_alt, color: Color(0xff1c2120)),
              ],
            ),
          ),
          actions: [
            Text("搜索       ",style:TextStyle(color: Color(0xff1c2120)),)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 历史记录部分
            const Text(
              '历史记录',
              style: TextStyle(color:Color(0xff1c2120),fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                _buildHistoryChip('日常'),
                _buildHistoryChip('脑卒中恢复计划'),
                _buildHistoryChip('脑卒中患者的饮食'),
                _buildHistoryChip('脑卒中'),
              ],
            ),

            const SizedBox(height: 16),

            // 猜你想搜部分
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '猜你想搜',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Color(0xff1c2120)),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.refresh, color: Colors.grey),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSuggestedSearch('脑卒中康复'),
                _buildSuggestedSearch('脑卒中康复训练动作'),
                _buildSuggestedSearch('关于脑卒中的饮食方面'),
                _buildSuggestedSearch('脑卒中的十大为何'),
              ],
            ),

            const SizedBox(height: 16),

            // 今日热点话题分享部分
            const Text(
              '今日热点话题分享',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Color(0xff1c2120)),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _buildHotTopic(
                    rank: index + 1,
                    title: _mockHotTopics[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 历史记录的 Chip
  Widget _buildHistoryChip(String label) {
    return Chip(
      label: Text(label,style: TextStyle(color: Color(0xff1c2120)),),
      backgroundColor: Color(0XFFe8edf5),
    );
  }

  // 猜你想搜的条目
  Widget _buildSuggestedSearch(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, color: Color(0xff1c2120)),
      ),
    );
  }

  // 热点话题条目
  Widget _buildHotTopic({required int rank, required String title}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Text(
        '$rank.',
        style: TextStyle(
          color: rank <= 3 ? Colors.red : Color(0xff1c2120),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14,color: Color(0xff1c2120)),
      ),
      trailing: const Icon(Icons.arrow_forward, color: Colors.white70),
    );
  }
}

// 模拟热点话题数据
const List<String> _mockHotTopics = [
  '如何预防脑卒中',
  '如何快速识别脑卒中',
  '什么是脑卒中',
  '脑卒中分几个时期',
  '患上脑卒中后能否彻底痊愈',
  '脑卒中有哪些先兆',
  '脑卒中的康复训练',
  '患上脑卒中后的饮食',
  '脑卒中患者的日常都是怎么样的',
  '我国有多少脑卒中患者',
];