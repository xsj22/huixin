import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'jilupage.dart';

class XunlianingPage extends StatefulWidget {
  const XunlianingPage({super.key});

  @override
  State<XunlianingPage> createState() => _XunlianingPageState();
}

class _XunlianingPageState extends State<XunlianingPage> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);

    _controller = CameraController(frontCamera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller!.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // 摄像头画面部分
            Expanded(
              flex: 2,
              child: _controller == null
                  ? const Center(child: CircularProgressIndicator())
                  : FutureBuilder(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CameraPreview(_controller!),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            // 按钮部分
            Container(
              width: double.infinity, // 按钮宽度填满屏幕
              padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 30), // 外边距，可控制两边空隙
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JiliPage(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF42DEE4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0), // 内部上下 padding
                ),
                child: Text(
                  "结束训练",
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
      ),
    );
  }
}
