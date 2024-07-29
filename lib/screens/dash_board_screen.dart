import 'package:ak_enterprises_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final List<Map<String, dynamic>> items = [
    {
      "title": "Today Deliveries",
      "icon": Icons.local_shipping,
      "routeUrl": "/deliveries",
      "color": Colors.blue,
      "imagePath": "assets/images/delivery.png",
    },
    {
      "title": "History",
      "icon": Icons.history,
      "routeUrl": "/deliverieshistory",
      "color": Colors.red,
      "imagePath": "assets/images/history.png",
    },
    {
      "title": "Today Receiving",
      "icon": Icons.receipt,
      "routeUrl": "/receivings",
      "color": Colors.orange,
      "imagePath": "assets/images/money.png",
    },
    {
      "title": "History",
      "icon": Icons.history,
      "routeUrl": "/receivingshistory",
      "color": Colors.red,
      "imagePath": "assets/images/history.png",
    },
    {
      "title": "Day Closing",
      "icon": Icons.close,
      "routeUrl": "/dayclosing",
      "color": Colors.green,
      "imagePath": "assets/images/closing.png",
    },
    {
      "title": "Main Screen",
      "icon": Icons.history,
      "routeUrl": "/history",
      "color": Colors.red,
      "imagePath": "assets/images/main.png",
    },
  ];

  Widget cardTile(String title, IconData icon, String routeUrl, Color color,
      String imagePath) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routeUrl);
        },
        child: Column(
          children: [
            Container(
              width: 140,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.2),
              ),
              child: Center(
                // child: Icon(
                //   icon,
                //   color: color,
                //   size: 50,
                // ),
                // child: SvgPicture.asset(
                //   imagePath,
                //   semanticsLabel: 'Acme Logo$imagePath',
                //   height: 60,
                // ),
                child: Image.asset(
                  imagePath,
                  width: 70,
                  height: 70,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(title,
                style: GoogleFonts.montserrat(color: color, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  void _logoutUser() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            title: const Text(
              "Confirmation",
            ),
            content: const Text(
              "Are you sure you want to logout?",
            ),
            actions: [
              GestureDetector(
                  onTap: () {
                    // SecureStorage secureStorage = SecureStorage();
                    // secureStorage.deleteSecureData(SecureStorageKeys.userId);
                    // secureStorage.deleteSecureData(SecureStorageKeys.username);
                    // secureStorage.deleteSecureData(SecureStorageKeys.email);

                    // Navigator.of(context).pop();
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const LoginPage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Constants.dangerColor,
                        borderRadius: BorderRadius.circular(5)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Text(
                      "Yes",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Text("No"),
                  )),
            ],
          );
        });
  }

  Widget _renderTitle() {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromRGBO(8, 37, 224, 1),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(45, 20),
              bottomRight: Radius.elliptical(45, 20))),
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dashboard",
                style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "Saleman Name",
                style:
                    GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color.fromRGBO(169, 43, 89, 1),
            ),
            width: 40,
            height: 40,
            child: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: ClipRRect(
      //   borderRadius: const BorderRadius.only(
      //     topRight: Radius.elliptical(45, 20),
      //     topLeft: Radius.elliptical(45, 20),
      //   ),
      //   child: BottomNavigationBar(
      //     backgroundColor: const Color.fromRGBO(8, 37, 224, 1),
      //     items: const [
      //       BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.dashboard,
      //             color: Color.fromRGBO(8, 37, 224, 1),
      //           ),
      //           label: ""),
      //       BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.dashboard,
      //             color: Color.fromRGBO(8, 37, 224, 1),
      //           ),
      //           label: "")
      //     ],
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _renderTitle(),
            const SizedBox(
              height: 20,
            ),
            // Links
            Expanded(
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return cardTile(
                      items[index]["title"],
                      items[index]["icon"],
                      items[index]["routeUrl"],
                      items[index]["color"],
                      items[index]["imagePath"]);
                },
              ),
            ),
            SizedBox(
              height: 50,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.elliptical(45, 20),
                  topLeft: Radius.elliptical(45, 20),
                ),
                child: Container(
                  decoration:
                      const BoxDecoration(color: Color.fromRGBO(8, 37, 224, 1)),
                  child: Center(
                      child: RichText(
                    text: TextSpan(
                      text: 'Developed At ',
                      style: DefaultTextStyle.of(context).style,
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'Edusoft',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
