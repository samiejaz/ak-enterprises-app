import 'package:ak_enterprises_app/utils/common_functions.dart';
import 'package:ak_enterprises_app/utils/constants.dart';
import 'package:flutter/material.dart';
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
      "color": Colors.blue
    },
    {
      "title": "History",
      "icon": Icons.history,
      "routeUrl": "/deliverieshistory",
      "color": Colors.red
    },
    {
      "title": "Today Receiving",
      "icon": Icons.receipt,
      "routeUrl": "/receivings",
      "color": Colors.orange
    },
    {
      "title": "History",
      "icon": Icons.history,
      "routeUrl": "/receivingshistory",
      "color": Colors.red
    },
    {
      "title": "Day Closing",
      "icon": Icons.close,
      "routeUrl": "/dayclosing",
      "color": Colors.green
    },
    {
      "title": "Main Screen",
      "icon": Icons.history,
      "routeUrl": "/history",
      "color": Colors.red
    },
  ];

  Widget cardTile(String title, IconData icon, String routeUrl, Color color) {
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
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color.withOpacity(0.2),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: color,
                  size: 50,
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
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dashboard",
                style: GoogleFonts.montserrat(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "Saleman Name",
                style: GoogleFonts.montserrat(fontSize: 18),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.blue,
            ),
            width: 50,
            height: 50,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                _renderTitle(), // Links
                SizedBox(
                  height: 650,
                  child: GridView.builder(
                    itemCount: items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return cardTile(
                          items[index]["title"],
                          items[index]["icon"],
                          items[index]["routeUrl"],
                          items[index]["color"]);
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
