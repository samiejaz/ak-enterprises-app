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
      "icon": Icons.history,
      "routeUrl": "/receivingshistory",
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
            color: Constants.secondaryColor,
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Constants.textColor,
                size: 50,
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style:
                    const TextStyle(color: Constants.textColor, fontSize: 18),
              ),
            ],
          )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: const Text(
                        "17-Jul-2024",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "Wednesday",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // Name
                const Text(
                  "John Doe",
                  style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Links
                Expanded(
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
              ],
            )),
      ),
    );
  }
}
