import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String profileUrl;
  final String name;
  final String content;
  final bool likeStatus;
  final int likeCount;
  final int commentCount;
  final VoidCallback like;

  const ListItem({
    super.key,
    required this.profileUrl,
    required this.name,
    required this.content,
    required this.likeStatus,
    required this.likeCount,
    required this.commentCount,
    required this.like,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Image.network(profileUrl, width: 40, height: 40),
              Text(name),
            ],
          ),
          Text(content),
          Row(
            children: [
              IconButton(
                onPressed: like,
                icon: Icon(
                  Icons.favorite,
                  color: likeStatus ? Colors.red : Colors.grey,
                ),
              ),
              Text('$likeCount'),
              Text('$commentCount'),
            ],
          ),
        ],
      ),
    );
  }
}
