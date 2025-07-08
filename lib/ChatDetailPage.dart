import 'package:flutter/material.dart';

class ChatDetailPage extends StatelessWidget {
  final String title;

  const ChatDetailPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c2120),
      appBar: AppBar(
        backgroundColor: Color(0xff1c2120),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 23,
              backgroundColor: Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // 聊天消息区域
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildMessageHeader('星期五 15:26'),
                SizedBox(height: 10,),
                _buildReceivedMessage('小水', '大家下午好啊\n今天天气好好，大家都在干什么'),
              ],
            ),
          ),

          // 底部输入框
          _buildMessageInput(),
        ],
      ),
    );
  }

  // 消息时间头部
  Widget _buildMessageHeader(String time) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          time,
          style: const TextStyle(color: Colors.grey, fontSize: 15,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // 收到的消息
  Widget _buildReceivedMessage(String sender, String message) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sender,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xff272b2a),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 底部输入框
  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xff1c2120),
      ),
      child: Row(
        children: [
          const Icon(Icons.mic, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: '发信息...',
                hintStyle: TextStyle(color: Colors.white70),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                filled: true,
                fillColor: Color(0xff272b2a),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.sentiment_satisfied_alt_outlined, color: Colors.grey),
          const SizedBox(width: 8),
          const Icon(Icons.add, color: Colors.grey),
        ],
      ),
    );
  }
}