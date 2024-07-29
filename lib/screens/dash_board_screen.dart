import 'package:ak_enterprises_app/utils/common_functions.dart';
import 'package:ak_enterprises_app/utils/constants.dart';
import 'package:flutter/material.dart';

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
    },
    {
      "title": "History",
      "icon": Icons.history,
      "routeUrl": "/deliverieshistory",
    },
    {
      "title": "Today Receiving",
      "icon": Icons.receipt,
      "routeUrl": "/receivings",
    },
    {
      "title": "History",
      "icon": Icons.history,
      "routeUrl": "/receivingshistory",
    },
    {
      "title": "Day Closing",
      "icon": Icons.close,
      "routeUrl": "/dayclosing",
    },
    {
      "title": "Main Screen",
      "icon": Icons.history,
      "routeUrl": "/history",
    },
  ];

  Widget cardTile(String title, IconData icon, String routeUrl) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routeUrl);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 5,
                  offset: Offset(0, 1),
                  spreadRadius: 0.1,
                  blurStyle: BlurStyle.normal),
            ],
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.black,
                size: 50,
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          )),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: _logoutUser,
              icon: const Icon(Icons.logout),
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                // Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Salesman Name",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      formatDateToDDMMYYYY(DateTime.now()),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // Links
                SizedBox(
                  height: 500,
                  child: GridView.builder(
                    itemCount: items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 150),
                    itemBuilder: (BuildContext context, int index) {
                      return cardTile(items[index]["title"],
                          items[index]["icon"], items[index]["routeUrl"]);
                    },
                  ),
                ),
                // Addtional Links

                // GestureDetector(
                //   onTap: () {
                //     Navigator.of(context).pushNamed("/history");
                //   },
                //   child: Container(
                //     margin: const EdgeInsets.all(0),
                //     decoration: BoxDecoration(
                //         boxShadow: const [
                //           BoxShadow(
                //               color: Colors.black54,
                //               blurRadius: 5,
                //               offset: Offset(0, 1),
                //               spreadRadius: 0.1,
                //               blurStyle: BlurStyle.normal),
                //         ],
                //         color: Colors.white,
                //         borderRadius: BorderRadiusDirectional.circular(5)),
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 60, vertical: 10),
                //     child: const Text(
                //       "History",
                //       style: TextStyle(color: Colors.black),
                //     ),
                //   ),
                // )
              ],
            )),
      ),
    );
  }
}
