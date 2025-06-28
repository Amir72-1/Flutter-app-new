import 'package:first_app/model/user.dart';
import 'package:first_app/utils/user_preferences.dart';
import 'package:first_app/widgets/appbar_widget.dart';
import 'package:first_app/widgets/profile_widget.dart';
import 'package:first_app/widgets/textfield_widgets.dart';
import 'package:flutter/material.dart';


class EditProfilePage extends StatefulWidget {
  

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: buildAppBar(context),
    body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 32),
      physics: BouncingScrollPhysics() ,
      children: [
        ProfileWidget(
          imagePath: user.imagePath,
        isEdit: true,
         onClicked : () async {}, 
         ),
         const SizedBox(height: 24,) ,

         TextfieldWidgets(
          label: 'Full Name',
          text: user.name,
          onChanged: (name) {},
         ),
         
      ],
    ),
  );
    
  
}