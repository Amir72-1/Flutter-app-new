import 'package:first_app/model/user.dart';
import 'package:first_app/utils/user_preferences.dart';
import 'package:first_app/widgets/appbar_widget.dart';
import 'package:first_app/widgets/number_widget.dart';
import 'package:first_app/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser; 

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(imagePath: user.imagePath,
          onClicked:() async {}, isEdit: false,
          ),
          const SizedBox(height: 24,),
          buildName(user),
          const SizedBox(height: 40,),
          NumberWidget(),
          const SizedBox(height: 50,),
          buildAbout(user),

         
        ],
      ),
    
    );
  }

  Widget buildName(User user) => Column(
    children: [Text(
      user.name,
      style: TextStyle(fontWeight: FontWeight.bold,fontSize:24)
    ),
    const SizedBox(height: 4,),
    Text(user.email,
    style: TextStyle(color: Colors.grey),
    )
    ],
  );
  
  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
      Text('About Doctor',
      style: TextStyle(fontSize: 16,height: 1.4, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16,),
      Text(user.about,
      style: TextStyle(fontSize: 14,height: 1.4),)
     ],
    ),
  );
}