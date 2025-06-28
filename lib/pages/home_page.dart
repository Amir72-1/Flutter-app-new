import 'dart:convert';
import 'package:first_app/constants.dart';
import 'package:first_app/pages/homepage_widget/bookmark_page.dart';
import 'package:first_app/pages/homepage_widget/edit_profile_page.dart';
import 'package:first_app/pages/homepage_widget/history_page.dart';
// import 'package:first_app/pages/homepage_widget/profile_page.dart';
import 'package:first_app/pages/see_all.dart';
import 'package:flutter/material.dart';
import 'package:first_app/pages/search_page.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:first_app/widgets/custom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int index = 0;
  List<Map<String, dynamic>> payload = [];

  @override
  void initState() {
    super.initState();
    loadDoctorData();
  }

  Future<void> loadDoctorData() async {
    final jsonString = await rootBundle.loadString('assets/doctor_data.json');
    final decoded = jsonDecode(jsonString);
    setState(() {
      payload = List<Map<String, dynamic>>.from(decoded['data']);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      buildHomePage(),
      BookmarkPage(),
      HistoryPage(),
      EditProfilePage(),
    ];

    return Scaffold(
      backgroundColor: Constants.background,
      body: SafeArea(
        child: screens[index],
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: index,
        onDestinationSelected: (idx) => setState(() => index = idx),
      ),
    );
  }

  Padding buildHomePage() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                 
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-photo/curly-man-with-broad-smile-shows-perfect-teeth-being-amused-by-interesting-talk-has-bushy-curly-dark-hair-stands-indoor-against-white-blank-wall_273609-17092.jpg',
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {},
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'Addis Ababa',
                      child: Text('Addis Ababa'),
                    ),
                    PopupMenuItem(
                      value: 'Adama',
                      child: Text('Adama'),
                    ),
                    PopupMenuItem(
                      value: 'Bahir Dar',
                      child: Text('Bahir Dar'),
                    ),
                    PopupMenuItem(
                      value: 'Hawasa',
                      child: Text('Hawasa'),
                    ),
                  ],
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: BoxDecoration(
                      color: Constants.secondary,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      children: [
                        Text('Addis Ababa'),
                        Icon(Icons.expand_more),
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Constants.secondary,
                  child: Image.asset('assets/icons/notifications.png', scale: 5),
                ),
              ],
            ),
            SizedBox(
              width: 200,
              child: Text(
                'Health Solution Made Simple 👨‍⚕️',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchPage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Health packages',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        width: 55,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromARGB(255, 237, 235, 235),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Image.asset(
                            'assets/icons/filter.png',
                            fit: BoxFit.contain,
                            height: 10,
                            width: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Upcoming Schedule', style: TextStyle(fontSize: 15)),
              ],
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              width: 380,
              height: 120,
              decoration: BoxDecoration(
                color: Constants.container,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/doctor-wearing-white-coat-medium-shot_23-2149844579.jpg',
                      ),
                      radius: 20,
                    ),
                    title: Text(
                      'Elizabeth Henry',
                      style: TextStyle(fontSize: 16, color: Constants.text1),
                    ),
                    subtitle: Text(
                      'Nixon Care Hospital',
                      style: TextStyle(fontSize: 12, color:Constants.text1),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        
                        FlutterPhoneDirectCaller.callNumber('1234567890');
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Constants.secondary,
                        child: Icon(Icons.call, color: Colors.blueAccent),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Icon(Icons.calendar_month, color: Constants.text1, size: 20),
                      Text(
                        'November 30  2024',
                        style: TextStyle(color: Constants.text1, fontSize: 12),
                      ),
                      SizedBox(width: 30),
                      Icon(Icons.alarm, color: Constants.text1, size: 20),
                      Text(
                        '10:00 to 13:00',
                        style: TextStyle(color: Constants.text1, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Doctors Speciality', style: TextStyle(fontSize: 15)),
                Container(
                  width: 40,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Constants.container2,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SeeAll()),
                      );
                    },
                    child: Center(child: Text('see all', style: TextStyle(fontSize: 12))),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              width: 380,
              height: 100,
              decoration: BoxDecoration(
                color:Constants.container2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://img.freepik.com/premium-vector/heart-icon_1134104-12740.jpg',
                          ),
                          radius: 25,
                        ),
                        Text('Heart', style: TextStyle(fontSize: 12)),
                        Text('Doctor', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-vector/brain-human-anatomy-biology-organ-body-system-health-care-medical-hand-drawn-cartoon-art-illustration_56104-953.jpg',
                          ),
                        ),
                        Text('Brain', style: TextStyle(fontSize: 12)),
                        Text('Doctor', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                            'https://img.freepik.com/premium-vector/healthy-human-kidney-system-icon-part-urinary_71609-8238.jpg',
                          ),
                        ),
                        Text('Kidney', style: TextStyle(fontSize: 12)),
                        Text('Doctor', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-vector/hand-drawn-stomach-drawing-illustration_23-2151257528.jpg',
                          ),
                        ),
                        Text('Stomach', style: TextStyle(fontSize: 12)),
                        Text('Doctor', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: List.generate(payload.length, (idx) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    width: 380,
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Constants.container2,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          payload[idx]['image'],
                        ),
                        radius: 25,
                      ),
                      title: Text(payload[idx]['user_name'], style: TextStyle(fontSize: 15)),
                      subtitle: Text(
                        payload[idx]['job_title'],
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
