import 'package:anical/constants/colors.dart';
import 'package:anical/views/mikrogramm_view.dart';
import 'package:anical/views/milligramm_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 80,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 30,
              top: 5,
            ),
            child: Text(
              'AniCal',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: textPrimaryColor,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 33,
              top: 10,
            ),
            child: Text(
              'Anästhesie Perfusorenrechner',
              style: TextStyle(
                fontSize: 22,
                color: textPrimaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Align(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MilligrammView(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                primary: primaryButtonColor,
                minimumSize: const Size(120, 120),
                shape: const CircleBorder(),
                elevation: 2.5,
                shadowColor: textPrimaryColor,
              ),
              child: const Text(
                'mg',
                style: TextStyle(
                  color: textWhiteColor,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Align(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MikrogrammView(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    primary: primaryButtonColor, // 255, 56, 101, 166
                    minimumSize: const Size(120, 120),
                    shape: const CircleBorder(),
                    elevation: 2.5,
                    shadowColor: textPrimaryColor),
                child: const Text(
                  'µg',
                  style: TextStyle(
                    color: textWhiteColor,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
