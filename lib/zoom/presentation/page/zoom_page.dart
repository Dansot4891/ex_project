import 'package:flutter/material.dart';

class ZoomPage extends StatelessWidget {
  const ZoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Center(
                        child: ClipRect(
                          child: InteractiveViewer(
                            minScale: 1.0,
                            maxScale: 4.0,
                            panEnabled: true,
                            child: Image.network(
                              'https://www.sciencetimes.co.kr/jnrepo/uploads/2022/10/Screenshot-2022-10-15-at-23.32.27-396x480.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Image.network(
                'https://www.sciencetimes.co.kr/jnrepo/uploads/2022/10/Screenshot-2022-10-15-at-23.32.27-396x480.jpg',
                fit: BoxFit.contain,
              ),
            ),
            const Text(
              "asdfasdfadsfadsfasfasdfasdfasdfadsf",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
