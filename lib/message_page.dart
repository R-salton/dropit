import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Messages',style: Theme.of(context).textTheme.titleLarge,
        
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 15.w)
          ,child: Text('Recents',style: Theme.of(context).textTheme.bodySmall,
          ),
          ),
          Container(
            height: 100.h,
            padding: EdgeInsets.all(5),

            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRecentContact("John Doe",context),
                _buildRecentContact("Salton",context),
                _buildRecentContact("Karenzi",context),
                _buildRecentContact("Sadev",context),
                _buildRecentContact("Baraka",context),
                _buildRecentContact("Paul",context),
              ],
            ),
          ),
        Expanded(child: Container(
          child: ListView(
          children: [
            _buildMessageTile("Hi, I am John Doe","John Doe","10:00 AM",context),
            _buildMessageTile("Hi, I am John Doe","John Doe","10:00 AM",context),
          _buildMessageTile("Hello, I am John Doe","John Doe","10:00 AM",context),
          _buildMessageTile("Hi, I am John Doe","John Doe","10:00 AM",context),
            _buildMessageTile("I am John Doe","John Doe","10:00 AM",context),
            _buildMessageTile("Hi, I am John Doe","John Doe","10:00 AM",context),
          ],          ),
        ))
        
        ],
      )

    );
  }


Widget _buildMessageTile (String message,String name,String time,BuildContext context) {

  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
    leading: CircleAvatar(
      radius: 30.r,
      backgroundImage: NetworkImage('https://picsum.photos/300'),

    ),
    title: Text(name, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
    subtitle: Text(message,style: TextStyle(color: Colors.grey),
    overflow: TextOverflow.ellipsis,),
    trailing: Text(
      time,
      style: TextStyle(color: Colors.grey),
    ),
  );
}
 

Widget _buildRecentContact(name,BuildContext context) {
  return Padding(padding: EdgeInsets.symmetric(horizontal: 10.w),
  child: Column(

    children: [
      CircleAvatar(
        radius: 30.r,
        backgroundImage: NetworkImage('https://picsum.photos/200'),
      ),
      SizedBox(height: 5.h),

    Text(name,style: Theme.of(context).textTheme.bodyMedium,
    ),
    
    ],
  ),
  );
}
}

