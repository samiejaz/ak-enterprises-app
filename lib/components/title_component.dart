import 'package:ak_enterprises_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleComponent extends StatelessWidget {
  String title = "";
  double? fontSize = 28;

  TitleComponent({super.key, required this.title, this.fontSize = 28});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Constants.primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(45, 20),
              bottomRight: Radius.elliptical(45, 20))),
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromRGBO(169, 43, 89, 1),
              ),
              width: 40,
              height: 40,
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: GoogleFonts.montserrat(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
