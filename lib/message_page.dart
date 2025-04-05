import 'package:dropit/core/theme.dart';
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
                _buildRecentContact("John Doe","https://picsum.photos/200",context),
                _buildRecentContact("Salton","https://picsum.photos/100",context),
                _buildRecentContact("Karenzi","https://picsum.photos/600",context),
                _buildRecentContact("Sadev","https://picsum.photos/300",context),
                _buildRecentContact("Baraka","https://picsum.photos/400",context),
                _buildRecentContact("Paul","https://picsum.photos/500",context),
              ],
            ),
          ),
          SizedBox(height: 10.h,),
        Expanded(child: Container(
          decoration: BoxDecoration(
            color: DefaultColors.messageListPage,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.r),
              topRight: Radius.circular(50.r),
            ),
          ),
          child: ListView(
          children: [
            _buildMessageTile("Hi, I am John Doe","John Doe","https://picsum.photos/200","10:00 AM",context),
            _buildMessageTile("Hi, I am Salton","Salton","https://picsum.photos/100","10:00 AM",context),
            _buildMessageTile("Hi, I am Karenzi","Karenzi","https://picsum.photos/600","10:00 AM",context),
            _buildMessageTile("Hi, I am Sadev","Sadev","https://picsum.photos/300","10:00 AM",context),
            _buildMessageTile("Hi, I am Baraka","Baraka","https://picsum.photos/400","10:00 AM",context),
            _buildMessageTile("Hi, I am Paul","Paul","https://picsum.photos/500","10:00 AM",context),
          ],          ),
        ))
        
        ],
      )

    );
  }


Widget _buildMessageTile (String message,String name,String profilePicture,String time,BuildContext context) {

  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
    leading: CircleAvatar(
      radius: 30.r,
      backgroundImage: NetworkImage(profilePicture),

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
 

Widget _buildRecentContact(name, profiPicture,BuildContext context) {
  return Padding(padding: EdgeInsets.symmetric(horizontal: 10.w),
  child: Column(

    children: [
      CircleAvatar(
        radius: 30.r,
        backgroundImage: NetworkImage(profiPicture),
      ),
      SizedBox(height: 5.h),

    Text(name,style: Theme.of(context).textTheme.bodyMedium,
    ),
    
    ],
  ),
  );
}
}

