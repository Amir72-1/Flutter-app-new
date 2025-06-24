import 'package:first_app/main.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  HomepageState createState() {
    return HomepageState();
  }
}

class HomepageState extends State<Homepage> {
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Color(0xFFF0F1F3),
    body: SafeArea(
      child: PageView.builder(
        controller: controller,
        itemCount: 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return buildHomePage();
          } else {
            return Center(child: Text('Profile Page'));
          }
        },
      ),
    ),
    bottomNavigationBar: NavigationBar(
      height: 60,
      backgroundColor: Colors.white,
      selectedIndex: 0,
      destinations: [
        NavigationDestination(icon: Image.asset('assets/icons/house_home.webp',height: 35,width: 35,), label: 'Home'),
        NavigationDestination(icon: Image.asset('assets/icons/bookmark.png',height: 30,width: 30,), label: 'Bookmark'),
        NavigationDestination(icon: Image.asset('assets/icons/history.png',height: 30,width: 30,), label: 'History'),
        NavigationDestination(icon: Image.asset('assets/icons/profile.png',height: 30,width: 30,), label: 'Me'),
      ],
    ),
  );
}

Padding buildHomePage() {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20, top: 15),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [Text(' Addis Ababa'), Icon(Icons.expand_more)],
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
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
            style: TextStyle(fontSize: 25, color: Colors.black, ),
          ),
        ),
        SizedBox(height: 15),

        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Icon(Icons.search),
            title: Text('Health packages'),

            trailing: Container(
              width: 55,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 237, 235, 235),
              ),
              child: Image.asset('assets/icons/filter.png', scale: 1,height: 10,width: 10,),
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [Text('Upcoming Schedule', style: TextStyle(fontSize: 15))],
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          width: 380,
          height: 120,

          decoration: BoxDecoration(
            color: Color.fromARGB(216, 14, 117, 228),
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
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                subtitle: Text(
                  'Nixon Care Hospital',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                trailing: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.call, color: Colors.blueAccent),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  Icon(Icons.calendar_month, color: Colors.white, size: 20),
                  Text(
                    'Novermber 30  2024',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(width: 30),
                  Icon(Icons.alarm, color: Colors.white, size: 20),
                  Text(
                    '10:00 to 13:00',
                    style: TextStyle(color: Colors.white, fontSize: 12),
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
              child: Text('see all', style: TextStyle(fontSize: 12)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  children: [
                    SizedBox(width: 30),
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
        SizedBox(height: 30),
        Container(
          width: 380,
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 10),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://img.freepik.com/free-photo/medium-shot-smiley-doctor-with-coat_23-2148814212.jpg',
              ),
              radius: 25,
            ),
            title: Text('Micah Felix', style: TextStyle(fontSize: 15)),
            subtitle: Text('4.9 Cardiologist', style: TextStyle(fontSize: 12)),
          ),
        ),
      ],
    ),
  );
}
