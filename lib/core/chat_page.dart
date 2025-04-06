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
              _buildSentMessage(context,"I am fine, thank you!"),
              _buildReceivedMessage(context,"So what are you doing?"),
              _buildSentMessage(context,"I am just coding"),
              _buildReceivedMessage(context,"Seriously?, because you are a programmer?"),
              _buildSentMessage(context,"Yes, I am"),
              _buildReceivedMessage(context,"What do you do?"),
              _buildSentMessage(context,"I am coding"),
              _buildReceivedMessage(context,"Okay"),
            ]
          ),),
          _buildMessageInput(context,"Message..."),
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

Widget _buildSentMessage(BuildContext context, String message) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(bottom: 5.h,top: 5.h,right: 20.w),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: DefaultColors.senderMessage,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.w),bottomLeft: Radius.circular(20.w),bottomRight: Radius.circular(20..w),topRight: Radius.circular(0.w)),
        ),
        child: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

Widget _buildMessageInput(BuildContext context, String message) {
    return Container(
      margin: EdgeInsets.all(25.w),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: DefaultColors.sentMessageInput,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.add_a_photo_outlined,color: Colors.grey,),
          ),
          SizedBox(width: 10.w,),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: message,
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              style:TextStyle(color: Colors.white),
            ),
            
          ),
        
                SizedBox(width: 10.w,),
         
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.mic,color: Colors.grey,),
          ),
          SizedBox(width: 10.w,),
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.send,color: Colors.grey,),
          ),
         
        ],
      ),
    );
  }

}

