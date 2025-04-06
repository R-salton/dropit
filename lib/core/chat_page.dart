import 'package:dropit/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://picsum.photos/200',
              ),
              radius: 20,
            ),
            const SizedBox(width: 10),
            Text('Sadev',style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(icon: const Icon(Icons.search,color: Colors.white,), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ListView(
            padding: EdgeInsets.all(20.w),
            children: [
              _buildReceivedMessage(context,"Hi, how are you?"),
            ]
          ),)
        ],
      ),
    );
  }

  Widget _buildReceivedMessage(BuildContext context, String message) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 5.h,top: 5.h,right: 20.w),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: DefaultColors.receiverMessage,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.w),bottomRight: Radius.circular(20.w),bottomLeft: Radius.circular(20..w),topLeft: Radius.circular(0.w)),
        ),
        child: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}